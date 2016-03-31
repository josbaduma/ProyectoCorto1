`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:52:47 03/30/2016
// Design Name:   Temporizador
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Taller-Digital/ProyectoCorto1/Temporizador_test.v
// Project Name:  ProyectoCorto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Temporizador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Temporizador_test;

	// Inputs
	reg Clk;
	reg AbilitarCuenta;

	// Outputs
	wire FinalCuenta;

	// Instantiate the Unit Under Test (UUT)
	Temporizador uut (
		.Clk(Clk), 
		.AbilitarCuenta(AbilitarCuenta), 
		.FinalCuenta(FinalCuenta)
	);
 
	initial begin
		// Initialize Inputs
		Clk = 0;
		AbilitarCuenta = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
      #10; AbilitarCuenta = 1; 
		#40; AbilitarCuenta = 0;
	end
always
begin
#10 Clk <=~Clk;
end    
endmodule

