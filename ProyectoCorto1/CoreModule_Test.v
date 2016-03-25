`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:15:48 03/23/2016
// Design Name:   CoreModule
// Module Name:   C:/XilinxProjects/ProyectoCorto1/CoreModule_Test.v
// Project Name:  ProyectoCorto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CoreModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CoreModule_Test;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire HSync;
	wire VSync;
	wire [2:0] rgb;
	
	// Instantiate the Unit Under Test (UUT)
	CoreModule uut (
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
		#95;
        
		// Add stimulus here
		@(posedge clk);
			#5; rst = 1;
		@(posedge clk);
			#5; rst = 0;
	end

	always begin
		clk <= 0;
		#5;
		clk <= 1;
		#5;
	end
	
endmodule

