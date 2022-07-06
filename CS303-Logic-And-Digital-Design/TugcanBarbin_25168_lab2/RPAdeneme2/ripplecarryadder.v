`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:36 12/15/2020 
// Design Name: 
// Module Name:    ripplecarryadder 
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
module Adder (A, B, Cin, Sum, Carry);//3-bit Ripple Carry Adder
	input [19:0] A, B;
	input Cin;
	output [19:0] Sum;
	output Carry;
	wire [19:0] C;

	FA FA0 (A[0], B[0]^Cin, Cin, Sum[0], C[0]);
	FA FA2 (.A(A[1]), .B(B[1]^ Cin), .Cin(C[0]), .Sum(Sum[1]),
	.Carry(C[1]));
	FA FA3 (.A(A[2]), .B(B[2]^ Cin), .Cin(C[1]), .Sum(Sum[2]),
	.Carry(C[2]));
	FA FA4 (.A(A[3]), .B(B[3]^ Cin), .Cin(C[2]), .Sum(Sum[3]),
	.Carry(C[3]));
	FA FA5 (.A(A[4]), .B(B[4]^ Cin), .Cin(C[3]), .Sum(Sum[4]),
	.Carry(C[4]));
	FA FA6 (.A(A[5]), .B(B[5]^ Cin), .Cin(C[4]), .Sum(Sum[5]),
	.Carry(C[5]));
	FA FA7 (.A(A[6]), .B(B[6]^ Cin), .Cin(C[5]), .Sum(Sum[6]),
	.Carry(C[6]));
	FA FA8 (.A(A[7]), .B(B[7]^ Cin), .Cin(C[6]), .Sum(Sum[7]),
	.Carry(C[7]));
	FA FA9 (.A(A[8]), .B(B[8]^ Cin), .Cin(C[7]), .Sum(Sum[8]),
	.Carry(C[8]));
	FA FA10 (.A(A[9]), .B(B[9]^ Cin), .Cin(C[8]), .Sum(Sum[9]),
	.Carry(C[9]));
	FA FA11 (.A(A[10]), .B(B[10]^ Cin), .Cin(C[9]), .Sum(Sum[10]),
	.Carry(C[10]));
	FA FA12 (.A(A[11]), .B(B[11]^ Cin), .Cin(C[10]), .Sum(Sum[11]),
	.Carry(C[11]));
	FA FA13 (.A(A[12]), .B(B[12]^ Cin), .Cin(C[11]), .Sum(Sum[12]),
	.Carry(C[12]));
	FA FA14 (.A(A[13]), .B(B[13]^ Cin), .Cin(C[12]), .Sum(Sum[13]),
	.Carry(C[13]));
	FA FA15 (.A(A[14]), .B(B[14]^ Cin), .Cin(C[13]), .Sum(Sum[14]),
	.Carry(C[14]));
	FA FA16 (.A(A[15]), .B(B[15]^ Cin), .Cin(C[14]), .Sum(Sum[15]),
	.Carry(C[15]));
	FA FA17 (.A(A[16]), .B(B[16]^ Cin), .Cin(C[15]), .Sum(Sum[16]),
	.Carry(C[16]));
	FA FA18 (.A(A[17]), .B(B[17]^ Cin), .Cin(C[16]), .Sum(Sum[17]),
	.Carry(C[17]));
	FA FA19 (.A(A[18]), .B(B[18]^ Cin), .Cin(C[17]), .Sum(Sum[18]),
	.Carry(C[18]));
	FA FA20 (.A(A[19]), .B(B[19]^ Cin), .Cin(C[18]), .Sum(Sum[19]),
	.Carry(C[19]));
	assign Carry = C[19] ^ C[18];
endmodule
