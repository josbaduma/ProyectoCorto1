`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:19 05/16/2016 
// Design Name: 
// Module Name:    CondCheck 
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
module CondCheck(
    input [3:0] Cond,
    input [1:0] FlagA,
    input [1:0] FlagB,
    output reg CondEx
    );
initial begin
	CondEx = 1;
end

always @* begin
	case(Cond)
		4'b0000: CondEx = (FlagA[1]);
		4'b0001: CondEx = ~(FlagA[1]);
		4'b1010: CondEx = ~(FlagA[0] ^ FlagB[0]);
		4'b1011: CondEx = (FlagA[0] ^ FlagB[0]);
		4'b1100: CondEx = ((~FlagA[1]) & (~(FlagA[0] ^ FlagB[0])));
		4'b1101: CondEx = (FlagA[1] | (FlagA[0] ^ FlagB[0]));
		4'b1110: CondEx = 1;
		
		default: CondEx = 1;
	endcase
end

endmodule
