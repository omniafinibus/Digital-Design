// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"
// CREATED		"Mon Dec 24 15:06:52 2018"

module CU(
	Cin,
	A,
	B,
	countIn,
	Sel,
	Sign,
	Ovf,
	countOut,
	MINSIGN,
	SEGA,
	SEGB,
	SEGRes
);


input wire	Cin;
input wire	[3:0] A;
input wire	[3:0] B;
input wire	[2:0] countIn;
input wire	[1:0] Sel;
output wire	Sign;
output wire	Ovf;
output wire	[2:0] countOut;
output wire	[6:0] MINSIGN;
output wire	[6:0] SEGA;
output wire	[6:0] SEGB;
output wire	[6:0] SEGRes;

wire	[3:0] S;
wire	[3:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;

assign	Sign = SYNTHESIZED_WIRE_2;




Slice	b2v_inst(
	.Cin(Cin),
	.A(A),
	.B(B),
	.countIn(countIn),
	.Sel(Sel),
	.CoBo(SYNTHESIZED_WIRE_1),
	.countOut3(countOut),
	.S(S));


TOHEX_Block	b2v_inst10(
	.A(SYNTHESIZED_WIRE_0),
	.SEG(SEGRes));


to_signed_magnitude	b2v_inst11(
	.CiBi(SYNTHESIZED_WIRE_1),
	.S(S),
	.SEL(Sel),
	.sign(SYNTHESIZED_WIRE_2),
	.ovf(Ovf),
	.Res(SYNTHESIZED_WIRE_0));


TOHEX_Block	b2v_inst6(
	.A(B),
	.SEG(SEGB));


TOHEX_Block	b2v_inst7(
	.A(A),
	.SEG(SEGA));


min_sign_block	b2v_inst9(
	.inp(SYNTHESIZED_WIRE_2),
	.seg(MINSIGN));


endmodule
