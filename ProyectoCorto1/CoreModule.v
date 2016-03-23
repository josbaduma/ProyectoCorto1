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
	 input wire [1:0] inrgb,
	 output wire HSync, 
	 output wire VSync,
	 output wire [2:0] rgb
    );
	 	 
	 wire PixelCLK;
	 reg [2:0] rgb_reg;
	
	FreqDivisor divisor (
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
	
	always @(posedge clk, posedge rst)
	begin
		if(rst)
			rgb_reg = 0;
		else
		begin
			//Asignacion de colores
			rgb_reg[0] = 1;
			rgb_reg[1] = inrgb[0];
			rgb_reg[2] = inrgb[1];
		end
	end
	
	assign rgb = rgb_reg;
endmodule
