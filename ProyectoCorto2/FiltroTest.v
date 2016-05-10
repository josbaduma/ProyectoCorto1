`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:35:11 05/09/2016
// Design Name:   Filtro
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/FiltroTest.v
// Project Name:  ProyectoCorto2
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

module FiltroTest;

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
		#100;
        
		// Add stimulus here
		#10; boton0 = 1;
		#10; boton0 = 0;
	end

always begin
	#1; Clk = 0;
	#1; Clk = 1;
end
endmodule

