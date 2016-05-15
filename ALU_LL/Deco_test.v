`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:33:47 05/14/2016
// Design Name:   Deco
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Taller-Digital/ALU_LL/Deco_test.v
// Project Name:  ALU_LL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Deco
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Deco_test;

	// Inputs
	reg[31:0] ADD;
	reg[31:0] SUB;
	reg[31:0] AND;
	reg[31:0] OR;
	reg[31:0] ALUControl;

	// Outputs
	wire[31:0] Result;

	// Instantiate the Unit Under Test (UUT)
	Deco uut (
		.ADD(ADD), 
		.SUB(SUB), 
		.AND(AND), 
		.OR(OR), 
		.ALUControl(ALUControl), 
		.Result(Result)
	);

	initial begin
		// Initialize Inputs
		ADD = 1;
		SUB = 2;
		AND = 3;
		OR = 4;
		ALUControl = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
      #10; ALUControl = 1;
		 #10; ALUControl = 2;
		  #10; ALUControl = 3;
		   #10; ALUControl = 1;
	end
      
endmodule

