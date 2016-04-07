`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:58:31 04/07/2016
// Design Name:   VGA_Controller
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/VGA_Test.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGA_Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGA_Test;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire HSync;
	wire VSync;

	// Instantiate the Unit Under Test (UUT)
	VGA_Controller uut (
		.clk(clk), 
		.rst(rst), 
		.HSync(HSync), 
		.VSync(VSync)
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
		@(posedge clk)
			#5; rst = 0;

	end
   
	always begin	
		clk <= 0; #30;
		clk <= 1; #10;
	end
	
endmodule

