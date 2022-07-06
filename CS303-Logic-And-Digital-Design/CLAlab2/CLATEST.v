// Verilog test fixture created from schematic C:\Xilinx\14.7\ISE_DS\projects\CLAlab2\CLAsche.sch - Wed Dec 02 14:19:10 2020

`timescale 1ns / 1ps

module CLAsche_CLAsche_sch_tb();

// Inputs
   reg A2;
   reg B2;
   reg A1;
   reg B1;
   reg A0;
   reg B0;
   reg ADDSUB;
   reg A5;
   reg B5;
   reg A4;
   reg B4;
   reg A3;
   reg B3;
   reg A8;
   reg B8;
   reg A7;
   reg B7;
   reg A6;
   reg B6;
   reg A11;
   reg B11;
   reg A10;
   reg B10;
   reg A9;
   reg B9;
   reg A14;
   reg B14;
   reg A13;
   reg B13;
   reg A12;
   reg B12;

// Output
   wire OVF;
   wire C2;
   wire C1;
   wire C0;
   wire C5;
   wire C4;
   wire C3;
   wire C8;
   wire C7;
   wire C6;
   wire C11;
   wire C10;
   wire C9;
   wire C14;
   wire C13;
   wire C12;

// Bidirs

// Instantiate the UUT
   CLAsche UUT (
		.A2(A2), 
		.B2(B2), 
		.A1(A1), 
		.B1(B1), 
		.A0(A0), 
		.B0(B0), 
		.ADDSUB(ADDSUB), 
		.A5(A5), 
		.B5(B5), 
		.A4(A4), 
		.B4(B4), 
		.A3(A3), 
		.B3(B3), 
		.A8(A8), 
		.B8(B8), 
		.A7(A7), 
		.B7(B7), 
		.A6(A6), 
		.B6(B6), 
		.A11(A11), 
		.B11(B11), 
		.A10(A10), 
		.B10(B10), 
		.A9(A9), 
		.B9(B9), 
		.A14(A14), 
		.B14(B14), 
		.A13(A13), 
		.B13(B13), 
		.A12(A12), 
		.OVF(OVF), 
		.C2(C2), 
		.C1(C1), 
		.C0(C0), 
		.C5(C5), 
		.C4(C4), 
		.C3(C3), 
		.C8(C8), 
		.C7(C7), 
		.C6(C6), 
		.C11(C11), 
		.C10(C10), 
		.C9(C9), 
		.C14(C14), 
		.C13(C13), 
		.C12(C12), 
		.B12(B12)
   );
// Initialize Inputs

       initial begin
		B0 = 1;
		A0 = 0;
		A2 = 0;
		B2 = 1;
		B3 = 1;
		A3 = 0;
		B4 = 0;
		A4 = 0;
		B5 = 1;
		A5 = 1;
		A6 = 1;
		B6 = 1;
		B1 = 1;
		A1 = 0;
		B7 = 0;
		A7 = 0;
		A8 = 0;
		B8 = 0;
		A9 = 0;
		B9 = 0;
		A10 = 1;
		B10 = 1;
		A11 = 0;
		B11 = 0;
		A12 = 0;
		B12 = 0;
		A13 = 0;
		B13 = 0;
		B14 = 0;
		ADDSUB = 0;//add
		A14 = 0;
		#10;
		B0 = 1;
		A0 = 0;
		A2 = 0;
		B2 = 1;
		B3 = 1;
		A3 = 0;
		B4 = 0;
		A4 = 0;
		B5 = 1;
		A5 = 1;
		A6 = 1;
		B6 = 1;
		B1 = 1;
		A1 = 0;
		B7 = 0;
		A7 = 0;
		A8 = 0;
		B8 = 0;
		A9 = 0;
		B9 = 0;
		A10 = 1;
		B10 = 1;
		A11 = 0;
		B11 = 0;
		A12 = 1;
		B12 = 0;
		A13 = 0;
		B13 = 0;
		B14 = 0;
		ADDSUB = 1; //substraction
		A14 = 0;
		#10;
		B0 = 1;
		A0 = 0;
		A2 = 0;
		B2 = 1;
		B3 = 1;
		A3 = 0;
		B4 = 1;
		A4 = 0;
		B5 = 1;
		A5 = 1;
		A6 = 1;
		B6 = 1;
		B1 = 1;
		A1 = 0;
		B7 = 0;
		A7 = 1;
		A8 = 0;
		B8 = 0;
		A9 = 0;
		B9 = 0;
		A10 = 0;
		B10 = 1;
		A11 = 0;
		B11 = 0;
		A12 = 0;
		B12 = 1;
		A13 = 0;
		B13 = 0;
		B14 = 0;
		ADDSUB = 0; // addition
		A14 = 0;
		#10;
		B0 = 1;
		A0 = 0;
		A2 = 0;
		B2 = 1;
		B3 = 1;
		A3 = 0;
		B4 = 1;
		A4 = 0;
		B5 = 1;
		A5 = 1;
		A6 = 1;
		B6 = 1;
		B1 = 1;
		A1 = 0;
		B7 = 0;
		A7 = 1;
		A8 = 0;
		B8 = 0;
		A9 = 0;
		B9 = 0;
		A10 = 0;
		B10 = 1;
		A11 = 0;
		B11 = 0;
		A12 = 0;
		B12 = 1;
		A13 = 0;
		B13 = 0;
		B14 = 0;
		ADDSUB = 0; // addition
		A14 = 1;
   end
endmodule
