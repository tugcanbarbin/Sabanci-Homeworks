`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:55:00 12/14/2020 
// Design Name: 
// Module Name:    FA 
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
module FA(A, B, Cin, Sum, Carry);
	input A, B, Cin;
	output Sum, Carry;
	assign Carry = (A & B) | (A & Cin) | (B & Cin);
	assign Sum = A ^ B ^ Cin;
endmodule
