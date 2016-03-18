`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:41:52 03/17/2016
// Design Name:   VGA_Controller
// Module Name:   C:/XilinxProjects/ProyectoCorto1/VGA_Controller_Test.v
// Project Name:  ProyectoCorto1
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

module VGA_Controller_Test;

	// Inputs
	reg clk;
	reg rst;
	reg [1:0] inRGB;

	// Outputs
	wire HSync;
	wire VSync;
	wire [2:0] RGB;

	// Instantiate the Unit Under Test (UUT)
	VGA_Controller uut (
		.clk(clk), 
		.rst(rst), 
		.inRGB(inRGB), 
		.HSync(HSync), 
		.VSync(VSync), 
		.RGB(RGB)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		inRGB = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clk);
			#5; rst = 1;
		@(posedge clk);
			#5; rst = 0;
			
		#50; inRGB = 2'b00;
		#50; inRGB = 2'b01;
		#50; inRGB = 2'b10;
		#50; inRGB = 2'b11;
	end
   
	always begin
		clk <= 0;
		#20;
		clk <= 1;
		#20;
	end
endmodule

