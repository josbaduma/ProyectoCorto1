`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:59:55 04/07/2016
// Design Name:   FreqDivisor
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/Freq_Test.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FreqDivisor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Freq_Test;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire PixelCLK;

	// Instantiate the Unit Under Test (UUT)
	FreqDivisor uut (
		.clk(clk), 
		.rst(rst), 
		.PixelCLK(PixelCLK)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clk)
			#5; rst = 1;
		@(posedge clk);
			#5; rst = 0;
	end
	
	always begin
		clk <= 1;
		#5;
		clk <= 0;
		#5;
	end
      
endmodule

