`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:57:21 05/14/2016
// Design Name:   Neg
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Taller-Digital/ALU_LL/Neg_test.v
// Project Name:  ALU_LL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Neg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Neg_test;

	// Inputs
	reg[31:0] A0;

	// Outputs
	wire[31:0] A;

	// Instantiate the Unit Under Test (UUT)
	Neg uut (
		.A0(A0), 
		.A(A)
	);

	initial begin
		// Initialize Inputs
		A0 = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		A0 = 2;

	end
      
endmodule

