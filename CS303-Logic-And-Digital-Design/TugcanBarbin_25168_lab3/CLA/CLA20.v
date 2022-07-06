`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:59:24 12/15/2020 
// Design Name: 
// Module Name:    CLA20 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
/*
module CLA5(A,B,Cin,C,Sum);
	input [4:0]A;
	input [4:0]B;
	input Cin;
	output [4:0]Sum;
	output [4:0]Carry;
	wire [4:0] G;
	wire [4:0] P;
	assign G = A & B;
	assign P = A ^ B;
	assign C[0] = G[0] | Cin & P[0];
	assign C[1] = G[1] | G[0] & P[1] | Cin & P[0] & P[1];
	assign C[2] = G[2] | G[1] & P[2] | G[0] & P[1] & P[2] | Cin & P[0] & P[1] & P[2];
	assign C[3] = G[3] | G[2] & P[3] | G[1] & P[2] & P[3] | G[0]& P[1]& P[2] & P[3] 
	| Cin & P[0] & P[1] & P[2] & P[3];
	assign C[4] = G[4] | G[0] & P[1]& P[2] & P[3] & P[4] | G[1] & P[2] & P[3] & P[4]
	| G[2] & P[3] & P[4]| G[3] & P[4] | Cin & P[0] & P[1] & P[2] & P[3] & P[4];

endmodule
*/
//////////////////////////////////////////////////////////////////////////////////
module CLA5(A,B,Cin,Carry,Sum);
	input [4:0]A;
	input [4:0]B;
	input Cin;
	output [4:0]Sum;
	output [4:0]Carry;
	wire [4:0] G;
	wire [4:0] P;
	assign G = A & B ;
	assign P = A ^ B ;
	assign Carry[0] = G[0] | Cin & P[0];
	assign Carry[1] = G[1] | G[0] & P[1] | Cin & P[0] & P[1];
	assign Carry[2] = G[2] | G[1] & P[2] | G[0] & P[1] & P[2] | Cin & P[0] & P[1] & P[2];
	assign Carry[3] = G[3] | G[2] & P[3] | G[1] & P[2] & P[3] | G[0]& P[1]& P[2] & P[3] 
	| Cin & P[0] & P[1] & P[2] & P[3];
	assign Carry[4] = G[4] | G[0] & P[1]& P[2] & P[3] & P[4] | G[1] & P[2] & P[3] & P[4]
	| G[2] & P[3] & P[4]| G[3] & P[4] | Cin & P[0] & P[1] & P[2] & P[3] & P[4];
	
	assign Sum[0] = Cin ^ P[0];
	assign Sum[4:1] = Carry[3:0] ^ P[4:1];

endmodule
