`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:53 03/17/2016 
// Design Name: 
// Module Name:    CoreModule 
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
module CoreModule(
    input clk,
    input rst,
	 input wire [1:0] inRGB,
	 output HSync, 
	 output VSync,
	 output wire RGB
    );
	 
	 
	 wire PixelCLK;
	 wire HSync;
	 wire VSync;
	
	FreqDivisor divisor (
		.clk(clk), 
		.rst(rst),
		.PixelCLK(PixelCLK)
	);
	
	VGA_Controller vga (
		.clk(PixelCLK), 
		.rst(rst), 
		.inRGB(inRGB), 
		.HSync(HSync), 
		.VSync(VSync), 
		.RGB(RGB)
	);
	
endmodule
