`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:38:15 05/15/2016
// Design Name:   ALU_ARM
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Taller-Digital/ALU_LL/ALU_test.v
// Project Name:  ALU_LL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_ARM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [1:0] ALUControl;

	// Outputs
	wire [31:0] Result;
	wire Zero;
	wire Negative;
	wire Carry;
	wire Overflow;

	// Instantiate the Unit Under Test (UUT)
	ALU_ARM uut (
		.A(A), 
		.B(B), 
		.ALUControl(ALUControl), 
		.Result(Result), 
		.Zero(Zero), 
		.Negative(Negative), 
		.Carry(Carry), 
		.Overflow(Overflow)
	);

	initial begin
		// Initialize Inputs
		A = 7;
		B = 4;
		ALUControl = 0; 

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		#10; ALUControl = 1;
		#10; ALUControl = 2;
		#10; ALUControl = 3;

	end
      
endmodule

