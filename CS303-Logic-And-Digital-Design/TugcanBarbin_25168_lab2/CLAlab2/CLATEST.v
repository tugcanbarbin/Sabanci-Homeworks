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

// ------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------

// Input & Output Definitions
// Operation A (- or +) B
// A,B: operation inputs
// SUB: Add/Sub control signal
// C: output
// OVF: overflow

// -----------------------------------------------------------
// Modify definitions below according to your pin names!
`define A  {A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0}
`define B  {B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0}
`define T  {ADDSUB}
`define C  {C14,C13,C12,C11,C10,C9,C8,C7,C6,C5,C4,C3,C2,C1,C0}
`define V  {OVF}
// -----------------------------------------------------------

// Test cases
reg [14:0] A_array [15:0];
reg [14:0] B_array [15:0];
reg [14:0] C_array [15:0];
reg [0:0]  V_array [15:0];

initial begin
    // Addition with No Overflow
    A_array[ 0]=   (1468); B_array[ 0]=   (2053); C_array[ 0]=   (3521); V_array[ 0]= 0; // (+) + (+) - No overflow
    A_array[ 1]=  (10744); B_array[ 1]=  (-8009); C_array[ 1]=   (2735); V_array[ 1]= 0; // (+) + (-) - No overflow (Sum: (+))
    A_array[ 2]=   (3563); B_array[ 2]=  (-6730); C_array[ 2]=  (-3167); V_array[ 2]= 0; // (+) + (-) - No overflow (Sum: (-))
    A_array[ 3]=  (-3208); B_array[ 3]=   (4745); C_array[ 3]=   (1537); V_array[ 3]= 0; // (-) + (+) - No overflow (Sum: (+))
    A_array[ 4]=  (-7581); B_array[ 4]=   (1802); C_array[ 4]=  (-5779); V_array[ 4]= 0; // (-) + (+) - No overflow (Sum: (-))
    A_array[ 5]=  (-1304); B_array[ 5]= (-12603); C_array[ 5]= (-13907); V_array[ 5]= 0; // (-) + (-) - No overflow
    // Addition with Overflow
    A_array[ 6]=   (8832); B_array[ 6]=   (8480); C_array[ 6]= (-15456); V_array[ 6]= 1; // (+) + (+) - overflow
    A_array[ 7]=  (-3722); B_array[ 7]= (-12995); C_array[ 7]=  (16051); V_array[ 7]= 1; // (-) + (-) - overflow
    // Subtraction with No Overflow
    A_array[ 8]=  (10287); B_array[ 8]=   (4787); C_array[ 8]=   (5500); V_array[ 8]= 0; // (+) - (+) - No overflow (Sum: (+))
    A_array[ 9]=   (6650); B_array[ 9]=  (15398); C_array[ 9]=  (-8748); V_array[ 9]= 0; // (+) - (+) - No overflow (Sum: (-))
    A_array[10]=   (3214); B_array[10]=  (-3428); C_array[10]=   (6642); V_array[10]= 0; // (+) - (-) - No overflow
    A_array[11]= (-10657); B_array[11]=   (3396); C_array[11]= (-14053); V_array[11]= 0; // (-) - (+) - No overflow
    A_array[12]=  (-9893); B_array[12]= (-13495); C_array[12]=   (3602); V_array[12]= 0; // (-) - (-) - No overflow (Sum: (+))
    A_array[13]= (-16087); B_array[13]=  (-7443); C_array[13]=  (-8644); V_array[13]= 0; // (-) - (-) - No overflow (Sum: (-))
    // Subtraction with Overflow
    A_array[14]=  (11691); B_array[14]= (-12530); C_array[14]=  (-8547); V_array[14]= 1; // (+) - (-) - overflow
    A_array[15]=  (-7336); B_array[15]=  (14470); C_array[15]=  (10962); V_array[15]= 1; // (-) - (+) - overflow
    #0;
end

// Test signals
integer A_test;
integer B_test;

integer _MAX_VAL = 32'b00000000000000000011111111111111;
integer _MIN_VAL = 32'b11111111111111111100000000000000;

// Test & grade
integer k;
integer GRADE;

parameter ADD_SUM_RIGHT= 4;
parameter ADD_OVF_RIGHT= 2;
parameter SUB_SUM_RIGHT= 2;
parameter SUB_OVF_RIGHT= 1;
parameter TOTAL_GRADE  = 8*(ADD_SUM_RIGHT+ADD_OVF_RIGHT) + 8*(SUB_SUM_RIGHT+SUB_OVF_RIGHT);

initial begin
	// reset all signal
	`A = 15'd0;
	`B = 15'd0;
    `T = 1'b0;
    GRADE = 0;
    A_test = 0;	B_test = 0;
	k = 0;

    #100;
    // initialize
    `A = 15'd0;
    `B = 15'd0;
    `T = 1'b0;
    GRADE = 0;
    #10;

    // addition
    for(k=0; k<8; k=k+1) begin
        // give input
        `A = A_array[k];
        `B = B_array[k];
        `T = 1'b0;
        #1;

        // check result
        A_test = {{17{A_array[k][14]}},A_array[k]};
        B_test = {{17{B_array[k][14]}},B_array[k]};
        #1;

        $display("Addition -- Testcase:%d",k);

        if(C_array[k] === `C) begin
            $display("Addition result is correct! %d == %d",C_array[k],`C);
            GRADE = GRADE + ADD_SUM_RIGHT; #1;
        end
        else begin
            $display("Addition result is wrong! %d != %d",C_array[k],`C);
			#1;
        end

        if(((C_array[k] > _MAX_VAL) | (C_array[k] < _MIN_VAL)) & (`V === V_array[k])) begin
            $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
            GRADE = GRADE + ADD_OVF_RIGHT; #1;
        end
        else if(((C_array[k] <= _MAX_VAL) | (C_array[k] >= _MIN_VAL)) & (`V === V_array[k])) begin
            $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
            GRADE = GRADE + ADD_OVF_RIGHT; #1;
        end
        else begin
            $display("Overflow result is wrong! %d != %d\n",V_array[k],`V);
			#1;
        end
        #6;
    end
    #10;

    // subtraction
    for(k=8; k<16; k=k+1) begin
        `A = A_array[k];
        `B = B_array[k];
        `T = 1'b1;
        #1;

        // check result
        A_test = {{17{A_array[k][14]}},A_array[k]};
        B_test = {{17{B_array[k][14]}},B_array[k]};
        #1;

        $display("Subtraction -- Testcase:%d",k);

        if(C_array[k] === `C) begin
            $display("Subtraction result is correct! %d == %d",C_array[k],`C);
            GRADE = GRADE + SUB_SUM_RIGHT; #1;
        end
        else begin
            $display("Subtraction result is wrong! %d != %d",C_array[k],`C);
			#1;
        end

        if(((C_array[k] > _MAX_VAL) | (C_array[k] < _MIN_VAL)) & (`V === V_array[k])) begin
            $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
            GRADE = GRADE + SUB_OVF_RIGHT; #1;
        end
        else if(((C_array[k] <= _MAX_VAL) | (C_array[k] >= _MIN_VAL)) & (`V === V_array[k])) begin
            $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
            GRADE = GRADE + SUB_OVF_RIGHT; #1;
        end
        else begin
            $display("Overflow result is wrong! %d != %d\n",V_array[k],`V);
			#1;
        end
        #6;
    end

    $display("Your simulation grade is %d out of %d!\n",(GRADE>>1),(TOTAL_GRADE>>1));
	#1;
    $finish;
end

// ------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------

endmodule
