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
	 input Arriba0,
    input Abajo0,
    input Izquierda0,
    input Derecha0,
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
	wire Arriba,Abajo,Izquierda,Derecha, circulo,cuadrado,triangulo,ovalo,rectangulo,rombo,hexagono,pentagono,estrella,enter;
	
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
		.circle_select(circulo),
		.square_select(cuadrado),
		.triangle_select(triangulo),
		.oval_select(ovalo),
		.rectangle_select(rectangulo),
		.diamond_select(rombo),
		.hexagon_select(hexagono),
		.pentagon_select(pentagono),
		.star_select(estrella),
		.completeScreen(enter),
		.rgb(rgbNext)
	);
	
	//Code
	Filtro f1(Arriba0,clk,Arriba);
	Filtro f2(Abajo0,clk,Abajo);
	Filtro f3(Izquierda0,clk,Izquierda);
	Filtro f4(Derecha0,clk,Derecha);
	Filtro f5(Select0,clk,Select);
	SelectorDeImagenes sel (Izquierda,Derecha,Arriba,Abajo,Select, clk, circulo,cuadrado,triangulo,ovalo,rectangulo,
									rombo,hexagono,pentagono,estrella,enter);
	
	always @(posedge PixelCLK)
		rgb_reg <= rgbNext;
		
	assign rgb = rgb_reg;
	
endmodule
