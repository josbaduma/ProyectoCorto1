`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:48:39 05/14/2016
// Design Name:   Adder
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Taller-Digital/ALU_LL/Adder_test.v
// Project Name:  ALU_LL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Adder_test;

	// Inputs
	reg[31:0] A;
	reg[31:0] B;

	// Outputs
	wire[31:0] Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	Adder uut (
		.A(A), 
		.B(B), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
      A = 10;
		B = 5;
	end
      
endmodule

