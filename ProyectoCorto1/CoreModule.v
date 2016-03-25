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
	 output wire HSync, 
	 output wire VSync,
	 output wire [2:0] rgb
    );
	
	wire [9:0] HCount;
	wire [9:0] VCount;
	reg [2:0] rgb_reg;
	wire [2:0] rgbNext;
	
	FreqDivisor divisor (
		.clk(clk), 
		.rst(rst),
		.PixelCLK(PixelCLK)
	);
	
	VGA_Controller vga (
		.clk(PixelCLK), 
		.rst(rst),
		.HCount(HCount),
		.VCount(VCount),
		.HSync(HSync), 
		.VSync(VSync)
	);
	
	DrawFigures circle (
		.HCount(HCount),
		.VCount(VCount),
		.rgb(rgbNext)
	);
	
	always @(posedge PixelCLK)
		rgb_reg <= rgbNext;
		
	assign rgb = rgb_reg;
endmodule
