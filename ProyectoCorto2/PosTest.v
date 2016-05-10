`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:41:17 05/09/2016
// Design Name:   MousePos
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/PosTest.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MousePos
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PosTest;

	// Inputs
	reg [7:0] MagX;
	reg [7:0] MagY;
	reg Arriba;
	reg Abajo;
	reg Izquierda;
	reg Derecha;

	// Outputs
	wire [9:0] posMX;
	wire [9:0] posMY;

	// Instantiate the Unit Under Test (UUT)
	MousePos uut (
		.MagX(MagX), 
		.MagY(MagY), 
		.Arriba(Arriba), 
		.Abajo(Abajo), 
		.Izquierda(Izquierda), 
		.Derecha(Derecha), 
		.posMX(posMX), 
		.posMY(posMY)
	);

	initial begin
		// Initialize Inputs
		MagX = 50;
		MagY = 50;
		Arriba = 0;
		Abajo = 0;
		Izquierda = 0;
		Derecha = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#30; Abajo = 1;
		#30; Abajo = 0;
		#30; Derecha = 1;
		#30; Derecha = 0;
		#30; Arriba = 1;
		#30; Arriba = 0;
		#30; Izquierda = 1;
		#30; Izquierda = 0;

	end
      
endmodule

