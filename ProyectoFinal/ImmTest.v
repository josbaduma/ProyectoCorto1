`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:49:52 05/12/2016
// Design Name:   ExtendImm
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoFinal/ImmTest.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ExtendImm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ImmTest;

	// Inputs
	reg [11:0] Immediate;

	// Outputs
	wire [31:0] ExtImm;

	// Instantiate the Unit Under Test (UUT)
	ExtendImm uut (
		.Immediate(Immediate), 
		.ExtImm(ExtImm)
	);

	initial begin
		// Initialize Inputs
		Immediate = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Immediate = 12'h78;
	end
      
endmodule

