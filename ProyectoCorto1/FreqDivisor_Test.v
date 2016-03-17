`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:02:08 03/17/2016
// Design Name:   FreqDivisor
// Module Name:   C:/XilinxProjects/ProyectoCorto1/FreqDivisor_Test.v
// Project Name:  ProyectoCorto1
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

module FreqDivisor_Test;

	// Inputs
	reg CLK;
	reg RST;

	// Outputs
	wire PixelCLK;

	// Instantiate the Unit Under Test (UUT)
	FreqDivisor uut (
		.CLK(CLK), 
		.RST(RST),
		.PixelCLK(PixelCLK)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge CLK);
			#5; RST = 1;
		@(posedge CLK);
			#5; RST = 0;
	end
	
	always begin
		CLK <= 0;
		#5;
		CLK <= 1;
		#5;
	end
      
endmodule

