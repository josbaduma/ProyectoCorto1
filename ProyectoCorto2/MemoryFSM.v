`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:23 04/21/2016 
// Design Name: 
// Module Name:    MemoryFSM 
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
module MemoryFSM(
    input clk,
    input rst,
    input [4:0] value,
    output reg [15:0] cardreg
    );

reg [1:0] nextstate, state;
reg [4:0] cardA, cardB;
reg [15:0] counter;

always @(state, posedge clk)
begin
	case(state)
		
		2'b00: begin
			cardA <= value - 1;
			cardreg[cardA] <= 1;
			if(value == 0)
				nextstate <= 2'b00;
			else if(cardA != 5'b10000)
				nextstate <= 2'b01;
			else
				nextstate <= 2'b00;
			end
		2'b01:begin
			cardB <= value - 1;
			cardreg[cardB] <= 1;
			if (value == 0)
				nextstate <= 2'b01;
			else if(cardB != 5'b10000)
				nextstate <= 2'b10;
			else
				nextstate <= 2'b01;
			end
		2'b10:begin
			if(cardA == 5'b00000 && cardB == 5'b00001)
				nextstate <= 2'b11;
			else if(cardA == 5'b00010 && cardB == 5'b00011)
				nextstate <= 2'b11;
			else if(cardA == 5'b00100 && cardB == 5'b00101)
				nextstate <= 2'b11;
			else if(cardA == 5'b00110 && cardB == 5'b00111)
				nextstate <= 2'b11;
			else if(cardA == 5'b01000 && cardB == 5'b01001)
				nextstate <= 2'b11;
			else if(cardA == 5'b01010 && cardB == 5'b01011)
				nextstate <= 2'b11;
			else if(cardA == 5'b01100 && cardB == 5'b01101)
				nextstate <= 2'b11;
			else if(cardA == 5'b01110 && cardB == 5'b01111)
				nextstate <= 2'b11;
			else begin
				cardreg[cardA] = 0; 
				cardreg[cardB] = 0; 
				nextstate <= 2'b00;
				end
			end
		2'b11:begin
			counter <= counter + 1;
			if(counter != 5)
				nextstate <= 2'b11;
			else begin
				cardA <= 5'b10000; cardB <= 5'b10000;
				counter <= 0;
				nextstate <= 2'b00;
				end
			end
		default: nextstate <= 2'b00;
	endcase	
end

always @(posedge clk)
begin
	if(rst) begin
		cardreg <= 0;
		cardA <= 5'b10000; cardB <= 5'b10000;
		counter = 0;
		nextstate <= 2'b00;
		end
	else
		state <= nextstate;
end

endmodule
