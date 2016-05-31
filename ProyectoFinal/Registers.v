`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:16 05/11/2016 
// Design Name: 
// Module Name:    Registers 
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
module Registers(
    input clk,
    input WE3,
    input [4:0] ADDR1,
    input [4:0] ADDR2,
    input [4:0] ADDR3,
    input [31:0] WD3,
    output reg [31:0] RD1,
    output reg [31:0] RD2,
    input [31:0] R15
    );

reg [31:0] RegBank [15:0];

always @(posedge clk) begin
	RegBank[15] <= R15;
	
	if(WD3)
		RegBank[ADDR3] <= WD3;
	else begin
		RD1 <= RegBank[ADDR1];
		RD2 <= RegBank[ADDR2];
	end
end
endmodule
