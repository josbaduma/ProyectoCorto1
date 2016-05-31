`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:26:33 05/11/2016 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(
    input [31:0] ADDR,
    output reg [31:0] RD
    );

always @*
	case(ADDR)
		0: RD = 32'h020081E0;
		4: RD = 32'h021044E0;
		8: RD = 32'h014003E0;
		default: RD = 32'b0;
	endcase
	
endmodule
