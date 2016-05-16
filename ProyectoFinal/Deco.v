`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:59 05/14/2016 
// Design Name: 
// Module Name:    Deco 
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
module Deco(
    input[31:0] ADD,
    input[31:0] SUB, 
    input[31:0] AND,
    input[31:0] OR,
    input[1:0] ALUControl,
    output[31:0] Result
    );
assign Result = (ALUControl == 0)? ADD:
               (ALUControl == 1)? SUB:
					(ALUControl == 2)? AND:OR;


endmodule
