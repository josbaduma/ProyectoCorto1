`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:43:04 03/30/2016
// Design Name:   Antirrebotes
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Taller-Digital/ProyectoCorto1/antirrebotes_test.v
// Project Name:  ProyectoCorto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Antirrebotes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module antirrebotes_test;

	// Inputs
	reg boton0;
	reg Clk;
	reg t300ms;

	// Outputs
	wire actCuenta;
	wire boton;

	// Instantiate the Unit Under Test (UUT)
	Antirrebotes uut (
		.boton0(boton0), 
		.Clk(Clk), 
		.t300ms(t300ms), 
		.actCuenta(actCuenta), 
		.boton(boton)
	);

	initial begin
		// Initialize Inputs
		boton0 = 0;
		Clk = 0;
		t300ms = 0;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
      #20; boton0 = 1; t300ms = 0;
		#20; boton0 = 1; t300ms = 0;
		#20; boton0 = 1; t300ms = 1;
		#20; boton0 = 1; t300ms = 0;
		#20; boton0 = 0; t300ms = 0;
	end
  
always
begin
#10 Clk <=~Clk;
end   
endmodule

