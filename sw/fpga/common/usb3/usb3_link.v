
//
// usb 3.0 link level
//
// Copyright (c) 2013 Marshall H.
// All rights reserved.
// This code is released under the terms of the simplified BSD license. 
// See LICENSE.TXT for details.
//

module usb3_link (

input	wire			slow_clk,
input	wire			local_clk,
input	wire			reset_n,

input	wire	[4:0]	ltssm_state,
output	reg				ltssm_go_recovery,

input	wire	[31:0]	in_data,
input	wire	[3:0]	in_datak,
input	wire			in_active,

output	reg		[31:0]	out_data,
output	reg		[3:0]	out_datak,
output	reg				out_active,
output	reg				out_skp_inhibit,
output	reg				out_skp_defer,
input	wire			out_stall,

output	reg				err_lcmd_undefined,
output	reg				err_hp_crc,
output	reg				err_hp_seq,
output	reg				err_hp_type


);

`include "usb3_const.vh"	
	
	reg		[5:0]	send_state;
parameter	[5:0]	LINK_SEND_RESET		= 'd0,
					LINK_SEND_IDLE		= 'd2,
					LINK_SEND_0			= 'd4,
					LINK_SEND_1			= 'd6,
					LINK_SEND_2			= 'd8,
					LINK_SEND_3			= 'd10,
					LINK_SEND_4			= 'd12,
					LINK_SEND_CMDW_0	= 'd14,
					LINK_SEND_CMDW_1	= 'd16;

	reg		[5:0]	recv_state;
parameter	[5:0]	LINK_RECV_RESET		= 'd0,
					LINK_RECV_IDLE		= 'd2,
					LINK_RECV_HP_BAD	= 'd3,
					LINK_RECV_HP_0		= 'd4,
					LINK_RECV_HP_1		= 'd5,
					LINK_RECV_HP_2		= 'd6,
					LINK_RECV_HP_3		= 'd7,
					LINK_RECV_HP_4		= 'd8,
					LINK_RECV_HP_5		= 'd9,
					LINK_RECV_HP_6		= 'd10,
					LINK_RECV_HP_7		= 'd11,
					LINK_RECV_HP_8		= 'd12,
					LINK_RECV_HP_9		= 'd13,
					LINK_RECV_HP_10		= 'd14,
					LINK_RECV_CMDW_0		= 'd15,
					LINK_RECV_CMDW_1		= 'd16,
					LINK_RECV_CMDW_2		= 'd17,
					LINK_RECV_CMDW_3		= 'd18,
					LINK_RECV_CMDW_4		= 'd19;

	reg		[5:0]	expect_state;
parameter	[5:0]	LINK_EXPECT_RESET		= 'd0,
					LINK_EXPECT_IDLE		= 'd2,
					LINK_EXPECT_HDR_SEQ_AD	= 'd4,
					LINK_EXPECT_HP_1		= 'd6,
					LINK_EXPECT_HP_2		= 'd8,
					LINK_EXPECT_HP_3		= 'd10;
					
	reg		[5:0]	queue_state;
parameter	[5:0]	LINK_QUEUE_RESET		= 'd0,
					LINK_QUEUE_IDLE			= 'd2,
					LINK_QUEUE_HDR_SEQ_AD	= 'd4,
					LINK_QUEUE_HP_1			= 'd6,
					LINK_QUEUE_HP_2			= 'd8,
					LINK_QUEUE_HP_3		= 'd10;
						
	reg		[4:0]	rd_hp_state;
parameter	[4:0]	RD_HP_RESET			= 'd0,
					RD_HP_IDLE			= 'd1,
					RD_HP_LMP_0			= 'd4,
					RD_HP_LMP_1			= 'd5,
					RD_HP_LMP_2			= 'd6,
					RD_HP_LMP_3			= 'd7,
					RD_HP_LMP_4			= 'd8,
					RD_HP_TP_0			= 'd10,
					RD_HP_TP_1			= 'd11,
					RD_HP_TP_2			= 'd12,
					RD_HP_TP_3			= 'd13,
					RD_HP_TP_4			= 'd14,
					RD_HP_DP_0			= 'd16,
					RD_HP_DP_1			= 'd17,
					RD_HP_DP_2			= 'd18,
					RD_HP_DP_3			= 'd19,
					RD_HP_0				= 'd20,
					RD_HP_1				= 'd21,
					RD_HP_2				= 'd22,
					RD_HP_3				= 'd22;
					
					
	reg		[3:0]	rd_lcmd_state;
parameter	[3:0]	RD_LCMD_RESET		= 'd0,
					RD_LCMD_IDLE		= 'd1,
					RD_LCMD_0			= 'd2;
					
	reg		[3:0]	wr_lcmd_state;
parameter	[3:0]	WR_LCMD_RESET		= 'd0,
					WR_LCMD_IDLE		= 'd1,
					WR_LCMD_0			= 'd2,
					WR_LCMD_1			= 'd3;
	
	reg		[4:0]	ltssm_last;
	reg		[4:0]	ltssm_stored /* synthesis noprune */;
	reg				ltssm_changed /* synthesis noprune */;
	reg				ltssm_go_recovery_1;
	
	reg		[24:0]	dc;
	
	reg		[24:0]	u0l_timeout;
	reg		[24:0]	u0_recovery_timeout;
	reg		[24:0]	pending_hp_timer;
	reg		[24:0]	credit_hp_timer;
	reg		[7:0]	link_error_count;
	reg				force_linkpm_accept;
	reg		[24:0]	T_PORT_U2_TIMEOUT;
	
	reg		[2:0]	tx_hdr_seq_num /* synthesis noprune */;			// Header Sequence Number (0-7)
	reg		[2:0]	ack_tx_hdr_seq_num /* synthesis noprune */;		// ACK Header Seq Num
	reg		[2:0]	rx_hdr_seq_num /* synthesis noprune */;			// RX Header Seq Num
	wire	[2:0]	rx_hdr_seq_num_dec = rx_hdr_seq_num - 1;
	reg		[2:0]	local_rx_cred_count /* synthesis noprune */;	// Local RX Header Credit Count (0-4)
	reg		[2:0]	remote_rx_cred_count /* synthesis noprune */;	// Remote RX Header Credit
	reg		[1:0]	tx_cred_idx /* synthesis noprune */;			
	reg		[1:0]	rx_cred_idx /* synthesis noprune */;
	
	reg		[3:0]	in_header_pkt_queued;
	reg		[1:0]	in_header_pkt_pick;
	reg		[95:0]	in_header_pkt_work /* synthesis noprune */;
	reg		[95:0]	in_header_pkt_a /* synthesis noprune */;
	reg		[95:0]	in_header_pkt_b;
	reg		[95:0]	in_header_pkt_c;
	reg		[95:0]	in_header_pkt_d;
	reg		[95:0]	out_header_pkt_a;
	reg		[95:0]	out_header_pkt_b;
	reg		[95:0]	out_header_pkt_c;
	reg		[95:0]	out_header_pkt_d;
	reg				in_header_cred_a;
	reg				in_header_cred_b;
	reg				in_header_cred_c;
	reg				in_header_cred_d;
	
	reg		[15:0]	in_header_cw_a;
	reg		[15:0]	in_header_cw_b;
	reg		[15:0]	in_header_cw_c;
	reg		[15:0]	in_header_cw_d;
	reg		[15:0]	in_header_cw;
	wire	[2:0]	in_header_seq = in_header_cw[2:0];
	reg		[15:0]	in_header_crc_a;
	reg		[15:0]	in_header_crc_b;
	reg		[15:0]	in_header_crc_c;
	reg		[15:0]	in_header_crc_d;
	reg		[15:0]	in_header_crc;
	reg		[1:0]	in_header_err_count;
	
	reg				out_header_first_since_entry;
	
	reg		[31:0]	in_link_command /* synthesis noprune */;
	reg		[31:0]	in_link_command_1 /* synthesis noprune */;
	reg				in_link_command_act /* synthesis noprune */;

	wire	[31:0]	in_data_swap16 = {in_data[23:16], in_data[31:24], in_data[7:0], in_data[15:8]};
	wire	[31:0]	in_data_swap32 = {in_data[7:0], in_data[15:8], in_data[23:16], in_data[31:24]};
	
	reg		[10:0]	rx_lcmd  /* synthesis noprune */;
	reg				rx_lcmd_act  /* synthesis noprune */;
	
	reg		[10:0]	tx_lcmd  /* synthesis noprune */;
	reg				tx_lcmd_act  /* synthesis noprune */;
	reg				tx_lcmd_act_1;
	reg				tx_lcmd_queue;
	wire			tx_lcmd_do = (tx_lcmd_act & ~tx_lcmd_act_1) | tx_lcmd_queue;
	reg		[10:0]	tx_lcmd_latch;

	reg				tx_lcmd_done  /* synthesis noprune */;
	
	reg				tx_queue_open;
	reg				tx_queue_lup;
	reg		[2:0]	tx_queue_lcred;
		
	reg				send_port_cfg_resp;
	
	reg		[9:0]	qc;		// queue counter
	reg				queue_send_u0_adv;
	reg				sent_u0_adv;
	
	reg		[9:0]	rc;		// receive counter
	
always @(posedge local_clk) begin

	ltssm_last <= ltssm_state;
	ltssm_changed <= 0;
	ltssm_go_recovery_1 <= ltssm_go_recovery;
	
	out_skp_inhibit <= 0;
	out_skp_defer <= 0;
	
	out_data <= 32'h0;
	out_datak <= 4'b0000;
	out_active <= 1'b0;
	
	tx_lcmd_act <= 0;
	tx_lcmd_act_1 <= tx_lcmd_act;
	tx_lcmd_done <= 0;
	if(tx_lcmd_do) tx_lcmd_queue <= 1;
	
	rx_lcmd_act <= 0;

	crc_hp_rst <= 0;
	
	dc <= dc + 1'b1;
	rc <= rc + 1'b1;
		

	// detect LTSSM change
	if(ltssm_last != ltssm_state) begin
		ltssm_changed <= 1;
		ltssm_stored <= ltssm_last;
	end	

	if(ltssm_go_recovery & ~ltssm_go_recovery_1) begin
		// rising edge, increment error count
		link_error_count <= link_error_count + 1'b1;
	end
	
	// handle LTSSM change
	if(ltssm_changed) begin
		case(ltssm_state) 
		LT_U0: begin
			// upon entry to U0, we must send : (Page 194)
			// 1. Header Sequence Advertisement [LGOOD_(rx_hdr_seq_num-1)]
			// 2. Advertisement of Link Credits (ABCD)
			// flush all header packets in Tx Header Buffers =< advertised number
			// initialize ACK Tx HdrSeqNum to value_received+1
			// start PENDING_HP_TIMER and CREDIT_HP_TIMER in expectation of HdrSeqNum and RxHdrBufCred
			// Note that the state should be preserved upon U0 entry because Recovery and thereby U0
			// are entered quite frequently, and both ends need to keep track of what packets had been
			// sent prior to Recovery, whether by a random phy error or power state change (ex. U1->U0)
			
			if(ltssm_stored == LT_POLLING_IDLE || ltssm_stored == LT_HOTRESET) begin
				// only reset these in inital U0 entry or Hot Reset, lose state
				tx_hdr_seq_num <= 0;
				rx_hdr_seq_num <= 0;
				local_rx_cred_count <= 4;
				
				in_header_cred_a <= 0;
				in_header_cred_b <= 0;
				in_header_cred_c <= 0;
				in_header_cred_d <= 0;
				
				link_error_count <= 0;
				// flush all header packet buffers
				// TODO
			end
			
			if(ltssm_stored == LT_POLLING_IDLE || ltssm_stored == LT_RECOVERY_IDLE) begin
				// initiate advertisement
				queue_send_u0_adv <= 1;
			end
			
			// note that the local_rx_cred is not updated here.
			// it should be continually processed by internal logic and updated based on
			// the buffer contents.
			tx_cred_idx <= 0; // A
			rx_cred_idx <= 0; // A
			remote_rx_cred_count <= 0;
			// reset timers
			pending_hp_timer <= 0;
			credit_hp_timer <= 0;
			u0l_timeout <= 0;
			u0_recovery_timeout <= 0;
			dc <= 0;
			// reset flags
			force_linkpm_accept <= 0;
			tx_queue_lup <= 0;
			tx_queue_lcred <= 0;
			tx_queue_open <= 1;
			send_port_cfg_resp <= 0;
			// upon sending of first header packet, the remote rx hdr cred count
			// should be decremented
			out_header_first_since_entry <= 1;
			in_header_err_count <= 0;
		end
		LT_RECOVERY_IDLE: begin
			// we can de-assert the recovery signal now
			ltssm_go_recovery <= 0;
		end
		endcase	
	end
	
	//
	case(ltssm_state)
	LT_U0: begin
		pending_hp_timer <= pending_hp_timer + 1'b1;
		credit_hp_timer <= credit_hp_timer + 1'b1;
		
		
		// increment U0LTimeout up to its triggering amount (10uS)
		// shall be reset when sending any data, paused then restarted upon idle re-entry
		if(u0l_timeout < T_U0L_TIMEOUT) 
			u0l_timeout <= u0l_timeout + 1'b1;
			
		// increment U0RecoveryTimeout up to 1ms
		// shall be reset every time link command is received
		if(u0_recovery_timeout < T_U0_RECOVERY)
			u0_recovery_timeout <= u0_recovery_timeout + 1'b1;
		
		// U0LTimeout generation (LUP/LDN) keepalive
		//
		if(u0l_timeout == T_U0L_TIMEOUT) begin
			// we need to send LUP
			tx_queue_lup <= 1;
			u0l_timeout <= 0;
		end

		// detect absence of far-end heartbeat
		//
		if(u0_recovery_timeout == T_U0_RECOVERY) begin
			// tell LTSSM to transition to Recovery
			ltssm_go_recovery <= 1;
		end
	end
	default: begin
		sent_u0_adv <= 0;
	end
	endcase
	
	
	
	in_link_command_act <= 0;
	in_link_command_1 <= in_link_command;
	
	///////////////////////////////////////
	// LINK RECEIVE (RX) FSM
	///////////////////////////////////////
	
	case(recv_state)
	LINK_RECV_RESET: begin
		recv_state <= LINK_RECV_IDLE;
	end
	LINK_RECV_IDLE: begin
	
		if({in_data, in_datak, in_active} == {32'hFEFEFEF7, 4'b1111, 1'b1}) begin
			// Link Command Word
			u0_recovery_timeout <= 0;
			recv_state <= LINK_RECV_CMDW_0;
		end
		
		if({in_data, in_datak, in_active} == {32'hFBFBFBF7, 4'b1111, 1'b1}) begin
			// HPSTART ordered set
			rc <= 0;
			crc_hp_rst <= 1;
			recv_state <= LINK_RECV_HP_0;
		end
		
		if({in_data, in_datak, in_active} == {32'h5C5C5CF7, 4'b1111, 1'b1}) begin
			// Data Packet
			//recv_state <= LINK_RECV_HP_0;
		end
	end
	LINK_RECV_HP_0: begin
		// shift in header packet (12 bytes)
		case(rx_cred_idx)
		0: in_header_pkt_a <= {in_header_pkt_a[63:0], in_data};
		1: in_header_pkt_b <= {in_header_pkt_b[63:0], in_data};
		2: in_header_pkt_c <= {in_header_pkt_c[63:0], in_data};
		3: in_header_pkt_d <= {in_header_pkt_d[63:0], in_data};
		endcase
		crc_hp_in <= in_data_swap32;
		if(rc == 2) recv_state <= LINK_RECV_HP_1;
	end
	LINK_RECV_HP_1: begin
		// load crc16 of HP + control word (4 bytes)
		case(rx_cred_idx)
		0: {in_header_crc_a, in_header_cw_a} <= in_data_swap16;
		1: {in_header_crc_b, in_header_cw_b} <= in_data_swap16;
		2: {in_header_crc_c, in_header_cw_c} <= in_data_swap16;
		3: {in_header_crc_d, in_header_cw_d} <= in_data_swap16;
		endcase
		in_header_crc <= in_data_swap16[31:16];
		in_header_cw <= in_data_swap16[15:0];
		recv_state <= LINK_RECV_HP_2;
	end
	LINK_RECV_HP_2: begin
		// check CRC-5, CRC-16 against calculated values
		if(crc_hp_out == in_header_crc && crc_cw3_out == in_header_cw[15:11]) begin
			// matched
			if(in_header_seq == rx_hdr_seq_num && local_rx_cred_count > 0) begin
				// header seq num matches what we expect
				recv_state <= LINK_RECV_HP_3;
			end else begin
				err_hp_seq <= 1;
				recv_state <= LINK_RECV_IDLE;
				// transition to Recovery
				ltssm_go_recovery <= 1;
			end
			
		end else begin
			// didn't match
			// issue LBAD and do nothing until either 
			// 1. Recovery entered
			// 2. LRTY received
			tx_lcmd <= LCMD_LBAD;
			tx_lcmd_act <= 1;
			err_hp_crc <= 1;
			in_header_err_count <= in_header_err_count + 1'b1;
			recv_state <= LINK_RECV_HP_BAD;
			
			if(in_header_err_count == 3) begin
				// give up, go to Recovery
				ltssm_go_recovery <= 1;
			end
		end
	end
	LINK_RECV_HP_BAD: begin
		// wait for LRTY, or Recovery
		if(rx_lcmd_act && rx_lcmd == LCMD_LRTY || ltssm_state == LT_RECOVERY_IDLE) begin
			//
			recv_state <= LINK_RECV_IDLE;
		end
	end
	LINK_RECV_HP_3: begin
		// reset HP error count, decrement local RX cred count
		in_header_err_count <= 0;
		local_rx_cred_count <= local_rx_cred_count - 1'b1;
		rx_hdr_seq_num <= rx_hdr_seq_num + 1'b1;
		in_header_pkt_queued[3-rx_cred_idx] <= 1;
		// send LGOOD
		tx_lcmd <= {LCMD_LGOOD_0[10:2], rx_hdr_seq_num};
		tx_lcmd_act <= 1;
		// TODO delegate processing
		recv_state <= LINK_RECV_IDLE;
	end
	LINK_RECV_CMDW_0: begin
		// byteswap word
		// checks for activity may not be required, since 3C SKP not sent
		// except between packets
		if(in_active) begin
			in_link_command <= in_data_swap16;
			in_link_command_act <= 1;
			recv_state <= LINK_RECV_IDLE;
		end
	end
	endcase
	
	//
	// Link State Expect FSM
	//
	case(expect_state)
	LINK_EXPECT_RESET: expect_state <= LINK_EXPECT_IDLE;
	LINK_EXPECT_IDLE: begin
		if(ltssm_state == LT_POLLING_IDLE || ltssm_state == LT_RECOVERY_IDLE) begin
			// finish link training, we will want to expect
			// Header Sequence Advertisement next
			expect_state <= LINK_EXPECT_HDR_SEQ_AD;
		end
	end
	LINK_EXPECT_HDR_SEQ_AD: begin
		if(ltssm_state == LT_U0) begin
			// now it should happen
			
			case({rx_lcmd, rx_lcmd_act})
			{LCMD_LGOOD_0, 1'b1}: ack_tx_hdr_seq_num <= 1;
			{LCMD_LGOOD_1, 1'b1}: ack_tx_hdr_seq_num <= 2;
			{LCMD_LGOOD_2, 1'b1}: ack_tx_hdr_seq_num <= 3;
			{LCMD_LGOOD_3, 1'b1}: ack_tx_hdr_seq_num <= 4;
			{LCMD_LGOOD_4, 1'b1}: ack_tx_hdr_seq_num <= 5;
			{LCMD_LGOOD_5, 1'b1}: ack_tx_hdr_seq_num <= 6;
			{LCMD_LGOOD_6, 1'b1}: ack_tx_hdr_seq_num <= 7;
			{LCMD_LGOOD_7, 1'b1}: ack_tx_hdr_seq_num <= 0;
			{LCMD_LCRD_A, 1'b1}: begin 
				remote_rx_cred_count <= remote_rx_cred_count + 1'b1; 
				in_header_cred_a <= 1;
				rx_cred_idx <= rx_cred_idx + 1'b1;
			end
			{LCMD_LCRD_B, 1'b1}: begin 
				remote_rx_cred_count <= remote_rx_cred_count + 1'b1; 
				in_header_cred_b <= 1;
				rx_cred_idx <= rx_cred_idx + 1'b1;
			end
			{LCMD_LCRD_C, 1'b1}: begin 
				remote_rx_cred_count <= remote_rx_cred_count + 1'b1; 
				in_header_cred_c <= 1;
				rx_cred_idx <= rx_cred_idx + 1'b1;
			end
			{LCMD_LCRD_D, 1'b1}: begin 
				remote_rx_cred_count <= remote_rx_cred_count + 1'b1; 
				in_header_cred_d <= 1;
				rx_cred_idx <= rx_cred_idx + 1'b1;
				
				expect_state <= LINK_EXPECT_IDLE;
			end
			
			endcase 
		end
	end
	endcase
	
	case(rd_hp_state)
	RD_HP_RESET: rd_hp_state <= RD_HP_IDLE;
	RD_HP_IDLE: begin
		case(rx_hdr_seq_num_dec)
		0: begin
			if(in_header_pkt_queued[3]) in_header_pkt_pick <= 3; else
			if(in_header_pkt_queued[2]) in_header_pkt_pick <= 2; else
			if(in_header_pkt_queued[1]) in_header_pkt_pick <= 1; else
			if(in_header_pkt_queued[0]) in_header_pkt_pick <= 0; end
		1: begin
			if(in_header_pkt_queued[2]) in_header_pkt_pick <= 2; else
			if(in_header_pkt_queued[1]) in_header_pkt_pick <= 1; else
			if(in_header_pkt_queued[0]) in_header_pkt_pick <= 0; else
			if(in_header_pkt_queued[3]) in_header_pkt_pick <= 3; end
		2: begin
			if(in_header_pkt_queued[1]) in_header_pkt_pick <= 1; else
			if(in_header_pkt_queued[0]) in_header_pkt_pick <= 0; else
			if(in_header_pkt_queued[3]) in_header_pkt_pick <= 3; else
			if(in_header_pkt_queued[2]) in_header_pkt_pick <= 2; end
		3: begin
			if(in_header_pkt_queued[0]) in_header_pkt_pick <= 0; else
			if(in_header_pkt_queued[3]) in_header_pkt_pick <= 3; else
			if(in_header_pkt_queued[2]) in_header_pkt_pick <= 2; else
			if(in_header_pkt_queued[1]) in_header_pkt_pick <= 1; end
		endcase
		if(|in_header_pkt_queued) rd_hp_state <= RD_HP_0;
	end
	RD_HP_0: begin
		// copy packet to temp reg
		case(in_header_pkt_pick)
		3: in_header_pkt_work <= in_header_pkt_a;
		2: in_header_pkt_work <= in_header_pkt_b;
		1: in_header_pkt_work <= in_header_pkt_c;
		0: in_header_pkt_work <= in_header_pkt_d;
		endcase
		rd_hp_state <= RD_HP_1;
	end
	RD_HP_1: begin
		// decide what type it is
		rd_hp_state <= RD_HP_2;
		case(in_header_pkt_work[4:0])
		LP_TYPE_LMP: rd_hp_state <= RD_HP_LMP_0;
		LP_TYPE_TP: rd_hp_state <= RD_HP_TP_0;
		LP_TYPE_DP: rd_hp_state <= RD_HP_2;
		LP_TYPE_ITP: rd_hp_state <= RD_HP_2;
		default: err_hp_type <= 1;
		endcase
	end
	RD_HP_2: begin
		// flush buffer and send LCRED
		if(tx_queue_open) begin
			in_header_pkt_queued[in_header_pkt_pick] <= 0;
			tx_queue_lcred[2:0] <= {1'b1, rx_cred_idx};
			local_rx_cred_count <= local_rx_cred_count + 1'b1;
			rd_hp_state <= RD_HP_IDLE;
		end
	end	
	RD_HP_LMP_0: begin
		rd_hp_state <= RD_HP_2;
		case(in_header_pkt_work[8:5])
		LP_SUB_SETLINK: force_linkpm_accept <= in_header_pkt_work[10];
		LP_SUB_U2INACT: T_PORT_U2_TIMEOUT <= in_header_pkt_work[16:9];
		LP_SUB_VENDTEST: begin end
		LP_SUB_PORTCAP: begin end
		LP_SUB_PORTCFG: begin end
		LP_SUB_PORTCFGRSP: send_port_cfg_resp <= 1;
		endcase
	end
	RD_HP_LMP_1: begin	end
	RD_HP_LMP_2: begin	end
	RD_HP_LMP_3: begin	end
	RD_HP_LMP_4: begin	end
	RD_HP_TP_0: begin
	
	end
	RD_HP_TP_1: begin
	
	end
	RD_HP_TP_2: begin
	
	end
	RD_HP_TP_3: begin
	
	end
	RD_HP_TP_4: begin
	
	end
	endcase
	
	
	//
	// Link Command READ FSM
	//
	case(rd_lcmd_state) 
	RD_LCMD_RESET: rd_lcmd_state <= RD_LCMD_IDLE;
	RD_LCMD_IDLE: begin
		if(in_link_command_act) begin
			// make sure command words match
			if(	in_link_command[10:0] == in_link_command[26:16] &&
				crc_cw1_out == in_link_command[31:27] &&
				crc_cw2_out == in_link_command[15:11] ) begin
				
				rd_lcmd_state <= RD_LCMD_0;
			end
		end
	end
	RD_LCMD_0: begin
		rd_lcmd_state <= RD_LCMD_IDLE;
		rx_lcmd <= in_link_command_1[10:0];
		rx_lcmd_act <= 1;
	end
	endcase
	
	

	
	//
	// Link State Queue FSM
	//
	case(queue_state)
	LINK_QUEUE_RESET: queue_state <= LINK_QUEUE_IDLE;
	LINK_QUEUE_IDLE: begin
		// check for queued advertisement from U0 entry, and wait a bit
		if(queue_send_u0_adv && (dc == 40)) begin
			queue_state <= LINK_QUEUE_HDR_SEQ_AD;
			queue_send_u0_adv <= 0;
			qc <= 0;
		end
	end
	LINK_QUEUE_HDR_SEQ_AD: begin
		if(tx_lcmd_done) qc <= qc + 1'b1;
		else
		case(qc)
		0: begin
			tx_lcmd <= {LCMD_LGOOD_0[10:3], rx_hdr_seq_num_dec[2:0]};
			tx_lcmd_act <= 1;
		end
		1: begin
			tx_lcmd <= LCMD_LCRD_A;
			tx_lcmd_act <= 1;
			// only advertise up to LOCAL_RX_CRED_COUNT
			if(local_rx_cred_count == 1) qc <= 5; 
		end
		2: begin
			tx_lcmd <= LCMD_LCRD_B;
			tx_lcmd_act <= 1;
			// only advertise up to LOCAL_RX_CRED_COUNT
			if(local_rx_cred_count == 2) qc <= 5;
		end
		3: begin
			tx_lcmd <= LCMD_LCRD_C;
			tx_lcmd_act <= 1;
			// only advertise up to LOCAL_RX_CRED_COUNT
			if(local_rx_cred_count == 3) qc <= 5;
		end
		4: begin
			tx_lcmd <= LCMD_LCRD_D;
			tx_lcmd_act <= 1;
		end
		5: sent_u0_adv <= 1;
		default: queue_state <= LINK_QUEUE_IDLE;
		endcase
	end
	endcase
	
	
	
	///////////////////////////////////////
	// LINK SEND (TX) FSM
	///////////////////////////////////////
	
	case(send_state)
	LINK_SEND_RESET: begin
		send_state <= LINK_SEND_IDLE;
	end
	LINK_SEND_IDLE: begin
		// N.B. potential race condition with loading queued CMD
		// upon exact cycle where queue was closed with another
		tx_queue_open <= 1;
		if(tx_lcmd_do) begin
			tx_lcmd_queue <= 0;
			tx_queue_open <= 0;
			send_state <= LINK_SEND_CMDW_0;
		end else 
		if(|tx_queue_lcred) begin
			tx_queue_lcred <= 0;
			tx_queue_open <= 0;
			tx_lcmd <= {LCMD_LCRD[10:2], rx_cred_idx[1:0]};
			send_state <= LINK_SEND_CMDW_0;
		end else 
		if(tx_queue_lup) begin
			tx_queue_lup <= 0;
			tx_queue_open <= 0;
			tx_lcmd <= LCMD_LUP;
			send_state <= LINK_SEND_CMDW_0;
		end
	end
	LINK_SEND_CMDW_0: begin
		if(wr_lcmd_state == WR_LCMD_IDLE) begin
			//tx_lcmd_act <= 0;
			tx_lcmd_latch <= tx_lcmd;
			//send_state <= LINK_SEND_CMDW_0;
			wr_lcmd_state <= WR_LCMD_0;
			// reset U0 LUP timeout
			u0l_timeout <= 0;
			send_state <= LINK_SEND_IDLE;
		end
	end
	/*
	LINK_SEND_CMDW_0: begin
		{out_data, out_datak} <= {32'hFEFEFEF7, 4'b1111};
		out_active <= 1;
		crc_lcmd_in <= tx_lcmd_latch;
		send_state <= LINK_SEND_CMDW_1;
	end
	LINK_SEND_CMDW_1: begin
		{out_data, out_datak} <= {2{tx_lcmd_latch[7:0], crc_lcmd_out[4:0], tx_lcmd_latch[10:8]}}, 4'b00};
		out_active <= 1;
		send_state <= LINK_SEND_IDLE;
	end
	*/
	endcase
	
		
	
	
	
	//
	// Link Command WRITE FSM
	//
	case(wr_lcmd_state) 
	WR_LCMD_RESET: wr_lcmd_state <= WR_LCMD_IDLE;
	WR_LCMD_IDLE: begin
		//if(
		//wr_lcmd_state <= WR_LCMD_1;	
	end
	WR_LCMD_0: begin
		{out_data, out_datak} <= {32'hFEFEFEF7, 4'b1111};
		out_active <= 1;
		crc_lcmd_in <= tx_lcmd_latch;
		wr_lcmd_state <= WR_LCMD_1;
	end
	WR_LCMD_1: begin
		{out_data, out_datak} <= {{2{tx_lcmd_latch[7:0], crc_lcmd_out[4:0], tx_lcmd_latch[10:8]}}, 4'b00};
		out_active <= 1;
		wr_lcmd_state <= WR_LCMD_IDLE;
		
		tx_lcmd_done <= 1;
	end
	
	endcase
	
	
	
	if(rx_lcmd_act) begin
		// process any Link Commands
		case(rx_lcmd)
		LCMD_LCRD_A: in_header_cred_a <= 1;
		LCMD_LCRD_B: in_header_cred_b <= 1;
		LCMD_LCRD_C: in_header_cred_c <= 1;
		LCMD_LCRD_D: in_header_cred_d <= 1;
		endcase
	end
		
	
	
	
	
	if(~reset_n) begin
		send_state <= LINK_SEND_RESET;
		recv_state <= LINK_RECV_RESET;
		expect_state <= LINK_EXPECT_RESET;
		queue_state <= LINK_QUEUE_RESET;
		rd_lcmd_state <= RD_LCMD_RESET;
		wr_lcmd_state <= WR_LCMD_RESET;
		
		err_lcmd_undefined <= 0;
		err_hp_crc <= 0;
		err_hp_seq <= 0;
		err_hp_type <= 0;
		
		link_error_count <= 0;
		
		in_header_cred_a <= 0;
		in_header_cred_b <= 0;
		in_header_cred_c <= 0;
		in_header_cred_d <= 0;
		
		ltssm_go_recovery <= 0;
		
		queue_send_u0_adv <= 0;
	end
end




//
// CRC-16 of Header Packet Headers
//
	reg				crc_hp_rst;
	reg		[31:0]	crc_hp_in;
	wire	[15:0]	crc_hp_out;
	
usb3_crc_hp iu3chp (
	.clk		( local_clk ),
	.rst		( crc_hp_rst ),
	.crc_en		( 1'b1 ),
	.d	( crc_hp_in ),
	.crc_out	( crc_hp_out )
);


//
// CRC-5 of Command Words
//

// RX
//
	wire	[10:0]	crc_cw1_in = in_link_command[26:16];
	wire	[4:0]	crc_cw1_out;
usb3_crc_cw iu3ccw1 (
	.data_in	( crc_cw1_in ),
	.crc_out	( crc_cw1_out )
);

	wire	[10:0]	crc_cw2_in = in_link_command[10:0];
	wire	[4:0]	crc_cw2_out;
usb3_crc_cw iu3ccw2 (
	.data_in	( crc_cw2_in ),
	.crc_out	( crc_cw2_out )
);

	wire	[10:0]	crc_cw3_in = in_header_cw[10:0];
	wire	[4:0]	crc_cw3_out;
usb3_crc_cw iu3ccw3 (
	.data_in	( crc_cw3_in ),
	.crc_out	( crc_cw3_out )
);

// TX
//
	reg		[10:0]	crc_lcmd_in;
	wire	[4:0]	crc_lcmd_out;
usb3_crc_cw iu3ccw4 (
	.data_in	( crc_lcmd_in ),
	.crc_out	( crc_lcmd_out )
);

endmodule
