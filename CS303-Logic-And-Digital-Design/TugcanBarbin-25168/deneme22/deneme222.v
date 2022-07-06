`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:38:25 01/01/2021 
// Design Name: 
// Module Name:    module1 
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
module tel (input clk,
 input rst,
 input startCall, answerCall,
 input endCallCaller, endCallCallee,
 input sendCharCaller, sendCharCallee,
 input [7:0] charSent,
 output reg [63:0] statusMsg,
 output reg [63:0] sentMsg, output reg [3:0] counter=0);

reg [31:0] cost=32'b0;
reg [2:0] current_state;
reg [2:0] next_state;

parameter idle = 3'b000;
parameter ringing = 3'b001;
parameter rejected= 3'b010;
parameter callersturn= 3'b011;
parameter calleesturn = 3'b100;
parameter costturn=3'b101;
// sequential part - state transitions
	always @ (posedge clk or posedge rst)
		begin
			if(rst)
				current_state <= idle;
			else
				current_state <= next_state;
		end
// clock counter 0-9 
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
			counter <= 0;  // reset counter
		else
			begin
			
			if(counter == 9) // if 9 then return to 0
				counter <= 0;
			else if(endCallCallee)
				counter <= 0;
			else if(current_state == ringing)
				counter <= counter + 1'b1;  // increment counter
			else if(current_state == rejected)
				counter <= counter+1'b1;// increment counter
			else if(current_state == costturn)
				counter <= counter +1'b1;// increment counter
			else  // if current state is not what we want then return to 0
				counter <= 0;
			end
	end
	// combinational part - next state definitions
	always @ (*) 
		begin
			case (current_state)
				idle: 
				begin
					if(startCall)  next_state = ringing;
					else next_state = idle;
				end
			ringing:
			begin
				if(answerCall)
				begin
					next_state = callersturn;
				end
				else if(endCallCaller)
				begin
					next_state = idle;
				end
				else if(counter == 9)
				begin
					next_state = idle;
				end
				else if(endCallCallee)
				begin
					next_state = rejected;
				end
				else
				begin
					next_state = ringing;
				end
			end
			callersturn:
			begin
				if(sendCharCaller == 1 && charSent == 127) next_state = calleesturn;
				else if (endCallCallee == 1 || endCallCaller == 1) next_state = costturn;
				else next_state = callersturn;
			end
			calleesturn:
			begin
				if(sendCharCallee == 1 && charSent == 127) next_state = callersturn;
				else if (endCallCallee == 1 || endCallCaller == 1) next_state = costturn;
				else next_state = calleesturn;
			end
			rejected:
			begin
				if(counter == 9)
				begin
					next_state = idle;
				end
				else 
				begin
					next_state = rejected;
				end
			end
			costturn:
			begin
				if(counter == 4)
				begin
					next_state = idle;
				end
				else 
				begin
					next_state = costturn;
				end 
			end
			endcase
	end
// sequential part - control registers
	always @ (posedge clk or posedge rst)
	begin
			if(rst) // if reset return to initial state "IDLE    "
				begin
					statusMsg[7:0]<=32;
					statusMsg[15:8]<=32;
					statusMsg[23:16]<=32;
					statusMsg[31:24]<=32;
					statusMsg[39:32]<=69;
					statusMsg[47:40]<=76;
					statusMsg[55:48]<=68;
					statusMsg[63:56]<=73;
				end
			else 
				begin
				if(current_state == idle)
					begin
						statusMsg[7:0]<=32;
						statusMsg[15:8]<=32;
						statusMsg[23:16]<=32;
						statusMsg[31:24]<=32;
						statusMsg[39:32]<=69;
						statusMsg[47:40]<=76;
						statusMsg[55:48]<=68;
						statusMsg[63:56]<=73;
					end
				else if (current_state == ringing)// "RINGING "
					begin
							statusMsg[7:0]<=32;
							statusMsg[15:8]<=71;
							statusMsg[23:16]<=78;
							statusMsg[31:24]<=73;
							statusMsg[39:32]<=71;
							statusMsg[47:40]<=78;
							statusMsg[55:48]<=73;
							statusMsg[63:56]<=82;
					end
				else if (current_state == callersturn)//"CALLER  "
					begin
							statusMsg[7:0]<=32;
							statusMsg[15:8]<=32;
							statusMsg[23:16]<=82;
							statusMsg[31:24]<=69;
							statusMsg[39:32]<=76;
							statusMsg[47:40]<=76;
							statusMsg[55:48]<=65;
							statusMsg[63:56]<=67;
					end
				else if (current_state == calleesturn)// "CALLEE  "
					begin
							statusMsg[7:0]<=32;
							statusMsg[15:8]<=32;
							statusMsg[23:16]<=69;
							statusMsg[31:24]<=69;
							statusMsg[39:32]<=76;
							statusMsg[47:40]<=76;
							statusMsg[55:48]<=65;
							statusMsg[63:56]<=67;
					end
				else if(current_state == rejected)// "REJECTED"
					begin
							statusMsg[7:0]<=68;
							statusMsg[15:8]<=69;
							statusMsg[23:16]<=84;
							statusMsg[31:24]<=67;
							statusMsg[39:32]<=69;
							statusMsg[47:40]<=74;
							statusMsg[55:48]<=69;
							statusMsg[63:56]<=82;
					end
				else if(current_state == costturn)// "COST    "
					begin
							statusMsg[7:0]<=32;
							statusMsg[15:8]<=32;
							statusMsg[23:16]<=32;
							statusMsg[31:24]<=32;
							statusMsg[39:32]<=84;
							statusMsg[47:40]<=83;
							statusMsg[55:48]<=79;
							statusMsg[63:56]<=67;
					end
			end
	end
// sequential part - outputs
	always @ (posedge clk or posedge rst)
		begin
			if(rst)
			begin
				sentMsg[7:0] <= 32;
				sentMsg[15:8] <= 32;
				sentMsg[23:16] <= 32;
				sentMsg[31:24] <= 32;
				sentMsg[39:32] <= 32;
				sentMsg[47:40] <= 32;
				sentMsg[55:48] <= 32;
				sentMsg[63:56] <= 32;
			end
			else
			begin
				if(current_state == callersturn)
				begin
					if(sendCharCaller)
					begin
						if(charSent<127 && charSent>31)
						begin
							if(charSent<58 && charSent>47)
							begin
								cost <= cost +1;
							end
							else
							begin
								cost <= cost+2;
							end
							sentMsg[7:0] <= charSent;
							sentMsg[15:8] <= sentMsg[7:0];
							sentMsg[23:16] <= sentMsg[15:8];
							sentMsg[31:24] <= sentMsg[23:16];
							sentMsg[39:32] <= sentMsg[31:24];
							sentMsg[47:40] <= sentMsg[39:32];
							sentMsg[55:48] <= sentMsg[47:40];
							sentMsg[63:56] <= sentMsg[55:48];
						end
						else if(charSent == 127)
						begin	
							cost <= cost + 2'b10;
							sentMsg[7:0] <= 32;
							sentMsg[15:8] <= 32;
							sentMsg[23:16] <= 32;
							sentMsg[31:24] <= 32;
							sentMsg[39:32] <= 32;
							sentMsg[47:40] <= 32;
							sentMsg[55:48] <= 32;
							sentMsg[63:56] <= 32;
						end
					end
				end
				else if(current_state == calleesturn)
				begin
					if(sendCharCallee)
					begin
						if(charSent<127 && charSent>31)
						begin
							if(charSent<58 && charSent>47)
							begin
								cost <= cost + 1'b1;
							end
							else
							begin
								cost <= cost + 2'b10;
							end
							sentMsg[7:0] <= charSent;
							sentMsg[15:8] <= sentMsg[7:0];
							sentMsg[23:16] <= sentMsg[15:8];
							sentMsg[31:24] <= sentMsg[23:16];
							sentMsg[39:32] <= sentMsg[31:24];
							sentMsg[47:40] <= sentMsg[39:32];
							sentMsg[55:48] <= sentMsg[47:40];
							sentMsg[63:56] <= sentMsg[55:48];
						end
						else if(charSent == 127)
						begin	
							cost <= cost + 2'b10;
							sentMsg[7:0] <= 32;
							sentMsg[15:8] <= 32;
							sentMsg[23:16] <= 32;
							sentMsg[31:24] <= 32;
							sentMsg[39:32] <= 32;
							sentMsg[47:40] <= 32;
							sentMsg[55:48] <= 32;
							sentMsg[63:56] <= 32;
						end
					end
				end
				else if(current_state == costturn)
				begin
					sentMsg[31:0]<= cost;
					sentMsg[63:32] <=0;
				end
				else
				begin
					sentMsg[7:0] <= 32;
					sentMsg[15:8] <= 32;
					sentMsg[23:16] <= 32;
					sentMsg[31:24] <= 32;
					sentMsg[39:32] <= 32;
					sentMsg[47:40] <= 32;
					sentMsg[55:48] <= 32;
					sentMsg[63:56] <= 32;
					cost <= 0;
				end
			end
		end
endmodule 