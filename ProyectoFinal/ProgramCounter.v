`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:38:44 05/11/2016 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(
    input clk,
    input [31:0] in,
    output reg [31:0] out
    );


reg [31:0] PC;

initial begin
	PC <= 0;
end

always @(posedge clk)
	out <= PC;

always @(negedge clk)
	PC <= in;

endmodule
