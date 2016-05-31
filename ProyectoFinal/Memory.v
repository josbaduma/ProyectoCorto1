`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:48 05/11/2016 
// Design Name: 
// Module Name:    Memory 
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
module Memory(
    input clk,
    input WE,
    input [31:0] ADDR,
    input [31:0] WD,
    output reg [31:0] RD
    );

reg [31:0] Memory [255:0];

always @(negedge clk) begin
	if(WE)
		Memory[ADDR] <= WD;
	else
		RD <= Memory[ADDR];
end

endmodule
