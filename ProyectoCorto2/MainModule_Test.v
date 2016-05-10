`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:30:56 05/08/2016
// Design Name:   MainModule
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/MainModule_Test.v
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

module MainModule_Test;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire HSync;
	wire VSync;
	wire [15:0] regCard;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	MainModule uut (
		.clk(clk), 
		.rst(rst), 
		.HSync(HSync), 
		.VSync(VSync), 
		.regCard(regCard), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clk)
			rst = 1; #5;
		@(posedge clk)
			rst = 0; #5;
	end
	
	always begin
		#5; clk = 0;
		#5; clk = 1;
	end
      
endmodule

