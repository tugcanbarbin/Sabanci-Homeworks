// Verilog test fixture created from schematic C:\Xilinx\14.7\ISE_DS\projects\nolurbit\lab2soru1genel.sch - Tue Dec 01 20:04:34 2020

`timescale 1ns / 1ps

module lab2soru1genel_lab2soru1genel_sch_tb();

// Inputs
   reg ADDSUB;
   reg B0;
   reg A0;
   reg A2;
   reg B2;
   reg B3;
   reg A3;
   reg B4;
   reg A4;
   reg B5;
   reg A5;
   reg A6;
   reg B6;
   reg B1;
   reg A1;
   reg B7;
   reg A7;
   reg A8;
   reg B8;
   reg A9;
   reg B9;
   reg A10;
   reg B10;
   reg A11;
   reg B11;
   reg A12;
   reg B12;
   reg A13;
   reg B13;
   reg A14;
   reg B14;

// Output
   wire C6;
   wire C5;
   wire C4;
   wire C3;
   wire C2;
   wire C1;
   wire C0;
   wire C7;
   wire C8;
   wire C9;
   wire C10;
   wire C11;
   wire C12;
   wire C13;
   wire C14;
   wire OVF;

// Bidirs

// Instantiate the UUT
   lab2soru1genel UUT (
		.ADDSUB(ADDSUB), 
		.B0(B0), 
		.A0(A0), 
		.A2(A2), 
		.B2(B2), 
		.B3(B3), 
		.A3(A3), 
		.B4(B4), 
		.A4(A4), 
		.B5(B5), 
		.A5(A5), 
		.A6(A6), 
		.B6(B6), 
		.C6(C6), 
		.C5(C5), 
		.C4(C4), 
		.C3(C3), 
		.C2(C2), 
		.B1(B1), 
		.A1(A1), 
		.C1(C1), 
		.C0(C0), 
		.B7(B7), 
		.A7(A7), 
		.C7(C7), 
		.C8(C8), 
		.A8(A8), 
		.B8(B8), 
		.C9(C9), 
		.A9(A9), 
		.B9(B9), 
		.C10(C10), 
		.A10(A10), 
		.B10(B10), 
		.C11(C11), 
		.A11(A11), 
		.B11(B11), 
		.C12(C12), 
		.A12(A12), 
		.B12(B12), 
		.C13(C13), 
		.A13(A13), 
		.B13(B13), 
		.C14(C14), 
		.A14(A14), 
		.B14(B14), 
		.OVF(OVF)
   );
// Initialize Inputs
       initial begin
		ADDSUB = 0;
		B0 = 0;
		A0 = 0;
		A2 = 0;
		B2 = 0;
		B3 = 0;
		A3 = 0;
		B4 = 0;
		A4 = 0;
		B5 = 0;
		A5 = 0;
		A6 = 0;
		B6 = 0;
		B1 = 0;
		A1 = 0;
		B7 = 0;
		A7 = 0;
		A8 = 0;
		B8 = 0;
		A9 = 0;
		B9 = 0;
		A10 = 0;
		B10 = 0;
		A11 = 0;
		B11 = 0;
		A12 = 0;
		B12 = 0;
		A13 = 0;
		B13 = 0;
		A14 = 0;
		B14 = 0;
   end
endmodule
