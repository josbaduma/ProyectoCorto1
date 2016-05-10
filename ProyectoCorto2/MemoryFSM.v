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
	 output reg [3:0] selNum,
    output reg [15:0] cardreg
    );

reg [1:0] nextstate, state;
reg [3:0] cardA, cardB;
reg [27:0] counter;

always @(posedge clk)
begin
	case(state)
		2'b00: begin
		
			cardA = value - 1;
						
			if(value == 0) begin
				cardreg[cardA] = 0;
				nextstate = 2'b00;
			end
			else if (cardreg[cardA] == 1) begin
				nextstate = 2'b00;
			end
			else begin
				cardreg[cardA] = 1;
				nextstate = 2'b01;
			end
			end
		2'b01:begin
		
			cardB = value - 1;
				
			if (value == 0) begin
				cardreg[cardB] = 0;
				nextstate = 2'b01;
			end
			else if (cardA == cardB) begin
				nextstate = 2'b01;
			end
			else if (cardreg[cardB] == 1) begin
				nextstate = 2'b01;
			end
			else begin
				cardreg[cardB] = 1;
				nextstate = 2'b10;
				end
			end
		2'b10:begin
			if(cardA == 4'b0000 && cardB == 4'b0001) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b0010 && cardB == 4'b0011) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b0100 && cardB == 4'b0101) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b0110 && cardB == 4'b0111) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b1000 && cardB == 4'b1001) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b1010 && cardB == 4'b1011) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b1100 && cardB == 4'b1101) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b1110 && cardB == 4'b1111) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b0001 && cardB == 4'b0000) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b0011 && cardB == 4'b0010) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b0101 && cardB == 4'b0100) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b0111 && cardB == 4'b0110) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b1001 && cardB == 4'b1000) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b1011 && cardB == 4'b1010) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b1101 && cardB == 4'b1100) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else if(cardA == 4'b1111 && cardB == 4'b1110) begin
				nextstate = 2'b00;
				selNum = selNum + 1;
			end
			else begin
				nextstate = 2'b11;
				end
			end
		2'b11:begin
			counter = counter + 1;
			if(counter != 28'h2faf080)
				nextstate = 2'b11;
			else begin
				cardreg[cardA] = 0; 
				cardreg[cardB] = 0;
				counter = 0;
				nextstate = 2'b00;
				end
			end
		default: begin nextstate = 2'b00;
							cardreg = 0;
							counter = 0;
					end
	endcase	
end

always @(posedge clk)
begin
	if(rst) begin
		state = 2'b00;
		end
	else
		state = nextstate;
end

endmodule
