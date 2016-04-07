`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:24:01 04/07/2016 
// Design Name: 
// Module Name:    MainModule 
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
module MainModule(
    input clk,
	 input rst,
    output wire HSync,
    output wire VSync
    );

wire PixelCLK;	 
	 
FreqDivisor freq (
	.clk(clk),
	.rst(rst),
	.PixelCLK(PixelCLK)
);

VGA_Controller vga (
	.clk(PixelCLK),
	.rst(rst),
	.HSync(HSync),
	.VSync(VSync)
);
endmodule
