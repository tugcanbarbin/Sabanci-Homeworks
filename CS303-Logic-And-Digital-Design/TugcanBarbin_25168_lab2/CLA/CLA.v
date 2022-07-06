`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:58:49 12/15/2020 
// Design Name: 
// Module Name:    CLA 
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
//////////////////////////////////////////////////////////////////////////////////
module CLA(A,B,Cin,Carry,Sum);
	input [19:0] A, B;
	input Cin;
	output [19:0] Sum;
	output Carry;
	wire[19:0] C;
	wire[19:0] Bctrl;
	assign Bctrl[0] = B[0] ^ Cin;
	assign Bctrl[1] = B[1] ^ Cin;
	assign Bctrl[2] = B[2] ^ Cin;
	assign Bctrl[3] = B[3] ^ Cin;
	assign Bctrl[4] = B[4] ^ Cin;
	assign Bctrl[5] = B[5] ^ Cin;
	assign Bctrl[6] = B[6] ^ Cin;
	assign Bctrl[7] = B[7] ^ Cin;
	assign Bctrl[8] = B[8] ^ Cin;
	assign Bctrl[9] = B[9] ^ Cin;
	assign Bctrl[10] = B[10] ^ Cin;
	assign Bctrl[11] = B[11] ^ Cin;
	assign Bctrl[12] = B[12] ^ Cin;
	assign Bctrl[13] = B[13] ^ Cin;
	assign Bctrl[14] = B[14] ^ Cin;
	assign Bctrl[15] = B[15] ^ Cin;
	assign Bctrl[16] = B[16] ^ Cin;
	assign Bctrl[17] = B[17] ^ Cin;
	assign Bctrl[18] = B[18] ^ Cin;
	assign Bctrl[19] = B[19] ^ Cin;
	CLA5 CLAone(A[4:0], Bctrl[4:0],Cin,C[4:0], Sum[4:0]);
	CLA5 CLAtwo(A[9:5], Bctrl[9:5], C[4], C[9:5], Sum[9:5]);
	CLA5 CLAthree(A[14:10], Bctrl[14:10],C[9],C[14:10], Sum[14:10]);
	CLA5 CLAfour(A[19:15], Bctrl[19:15],C[14], C[19:15], Sum[19:15]);
	assign Carry = C[18]^C[19];

endmodule
