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
	 input up0,
    input down0,
    input left0,
    input right0,
    input Select0,
	 output wire HSync, 
	 output wire VSync,
	 output wire [2:0] rgb
    );
	
	wire [9:0] HCount;
	wire [9:0] VCount;
	reg [2:0] rgb_reg;
	wire [2:0] rgbNext;
	
	//Variables internas
	wire up, down, left, right, select, circle, square, triangle, oval, rectangle, diamond, hexagon, pentagon, star, enter;
	
	FreqDivisor divisor (
		.clk(clk), 
		.rst(rst),
		.PixelCLK(PixelCLK)
	);
	
	VGA_Controller vga_sync (
		.clk(PixelCLK), 
		.rst(rst),
		.HCount(HCount),
		.VCount(VCount),
		.HSync(HSync), 
		.VSync(VSync)
	);
	
	DrawFigures draw_system (
		.HCount(HCount),
		.VCount(VCount),
		.circle_select(circle),
		.square_select(square),
		.triangle_select(triangle),
		.oval_select(oval),
		.rectangle_select(rectangle),
		.diamond_select(diamond),
		.hexagon_select(hexagon),
		.pentagon_select(pentagon),
		.star_select(star),
		.full_screen(enter),
		.rgb(rgbNext)
	);
	
	//Code
	Filtro f1(up0,clk,up);
	Filtro f2(down0,clk,down);
	Filtro f3(left0,clk,left);
	Filtro f4(right0,clk,right);
	Filtro f5(select0,clk,select);
	SelectorDeImagenes sel (left, right, up, down, select, clk, circulo, square, triangle, oval, rectangle,
									diamond, hexagon, pentagon, star, enter);
	
	always @(posedge PixelCLK)
		rgb_reg <= rgbNext;
		
	assign rgb = rgb_reg;
	
endmodule
