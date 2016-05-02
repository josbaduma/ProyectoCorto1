`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:55:58 05/01/2016
// Design Name:   MainModule
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/Main_Test.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MainModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Main_Test;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire HSync;
	wire VSync;
	wire [8:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	MainModule uut (
		.clk(clk), 
		.rst(rst), 
		.HSync(HSync), 
		.VSync(VSync), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always begin
		clk <= 1; #5;
		clk <= 0; #5;
	end
      
endmodule

