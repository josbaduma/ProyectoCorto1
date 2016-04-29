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
    input [3:0] value,
    output [15:0] cardreg
    );

reg [1:0] nextstate, state;
reg [3:0] cardA, cardB;
reg [15:0] counter;

always @(state, posedge clk)
begin
	case(state)
		
		2'b00:
			cardA <= value;
			if(cardA != 4'b0000)
				nextstate <= 2'b01;
			else
				nextstate <= 2'b00;
		2'b01:
			
		2'b10:
		2'b11:			
		
		default: nextstate <= 2'b00;
	endcase	
end

endmodule
