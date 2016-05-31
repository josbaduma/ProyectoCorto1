`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:50 05/19/2016 
// Design Name: 
// Module Name:    VGA 
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
module VGA(
    input clk,
    input rst,
    output [2:0] RGB,
    output HSync,
    output VSync
    );
	 
wire [9:0] HCount, VCount;

VGA_Controller vga (
	 .clk(clk),
	 .rst(rst),
	 .HCount(HCount),
	 .VCount(VCount),
	 .HSync(HSync),
	 .VSync(VSync)
	 );

DrawSystem draw (
	 .HCount(HCount),
	 .VCount(VCount),
	 .RGB(RGB)
	 );
endmodule
