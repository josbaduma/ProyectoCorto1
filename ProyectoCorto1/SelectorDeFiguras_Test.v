`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:29:08 03/31/2016
// Design Name:   SelectorDeImagenes
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Taller-Digital/ProyectoCorto1/SelectorDeFiguras_Test.v
// Project Name:  ProyectoCorto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SelectorDeImagenes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SelectorDeFiguras_Test;

	// Inputs
	reg Izquierda;
	reg Derecha;
	reg Arriba;
	reg Abajo;
	reg Select;
	reg Clk;

	// Outputs
	wire circulo;
	wire cuadrado;
	wire triangulo;
	wire ovalo;
	wire rectangulo;
	wire rombo;
	wire hexagono;
	wire pentagono;
	wire estrella;
	wire enter;

	// Instantiate the Unit Under Test (UUT)
	SelectorDeImagenes uut (
		.Izquierda(Izquierda), 
		.Derecha(Derecha), 
		.Arriba(Arriba), 
		.Abajo(Abajo), 
		.Select(Select), 
		.Clk(Clk), 
		.circulo(circulo), 
		.cuadrado(cuadrado), 
		.triangulo(triangulo), 
		.ovalo(ovalo), 
		.rectangulo(rectangulo), 
		.rombo(rombo), 
		.hexagono(hexagono), 
		.pentagono(pentagono), 
		.estrella(estrella), 
		.enter(enter)
	);

	initial begin
		// Initialize Inputs
		Izquierda = 0;
		Derecha = 0;
		Arriba = 0;
		Abajo = 0;
		Select = 0;
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
      #30;Izquierda = 0;Derecha = 1;Arriba = 0;Abajo = 0;Select = 0;//va a cuadrado
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;
		#20;Izquierda = 0;Derecha = 1;Arriba = 0;Abajo = 0;Select = 0;//va a triangulo
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 1;Select = 0;//va a rombo
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;
		#20;Izquierda = 1;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;//va aretan
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;
		#20;Izquierda = 1;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;//va a ovalo
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 1;Select = 0;//va a hexagono 
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;
		#20;Izquierda = 0;Derecha = 1;Arriba = 0;Abajo = 0;Select = 0;//va a pentagono
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;
		#20;Izquierda = 0;Derecha = 1;Arriba = 0;Abajo = 0;Select = 0;//va a estrellita
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 0;Select = 1;
		#20;Izquierda = 0;Derecha = 0;Arriba = 0;Abajo = 0;Select = 0;
		
	end
always 
begin
	Clk <= 0;
	#10;
	Clk <= 1;
	#10;
end 
endmodule

