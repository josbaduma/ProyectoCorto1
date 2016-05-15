`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:29:01 05/14/2016
// Design Name:   Dec_Sub
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Taller-Digital/ALU_LL/Dec_Sub_test.v
// Project Name:  ALU_LL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Dec_Sub
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Dec_Sub_test;

	// Inputs
	reg ALUControl_0;
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] C;

	// Instantiate the Unit Under Test (UUT)
	Dec_Sub uut (
		.ALUControl_0(ALUControl_0), 
		.A(A), 
		.B(B), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		ALUControl_0 = 0;
		A = 7;
		B = 4;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		ALUControl_0 = 1;

	end
      
endmodule

