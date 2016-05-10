`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:19:59 05/03/2016
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
	reg [4:0] value;

	// Outputs
	wire HSync;
	wire VSync;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	MainModule uut (
		.clk(clk), 
		.rst(rst), 
		.value(value), 
		.HSync(HSync), 
		.VSync(VSync), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		value = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clk)
			rst = 1; #5;
		@(posedge clk)
		   rst = 0; #5;
		@(posedge clk)
			value = 6; #60;
		@(posedge clk)
			value = 7; #60;
	end
	
	always begin
		clk <= 1; #5;
		clk <= 0; #5;
	end
      
endmodule

