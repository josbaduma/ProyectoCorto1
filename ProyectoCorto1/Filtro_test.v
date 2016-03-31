`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:49:41 03/30/2016
// Design Name:   Filtro
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Taller-Digital/ProyectoCorto1/Filtro_test.v
// Project Name:  ProyectoCorto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Filtro
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created 
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Filtro_test;

	// Inputs
	reg boton0;
	reg Clk;

	// Outputs
	wire boton;

	// Instantiate the Unit Under Test (UUT)
	Filtro uut (
		.boton0(boton0), 
		.Clk(Clk), 
		.boton(boton)
	);

	initial begin
		// Initialize Inputs
		boton0 = 0;
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
		//#100;boton0 = 0; 
		#50;boton0 = 1;
		#200;boton0 = 0;

	end
always 
begin
#10 Clk <=~Clk;
end    
endmodule

