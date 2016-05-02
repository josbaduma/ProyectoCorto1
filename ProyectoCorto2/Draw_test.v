`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:54:16 05/01/2016
// Design Name:   DrawSystem
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/Draw_test.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DrawSystem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Draw_test;

	// Inputs
	reg clk;
	reg [9:0] HCount;
	reg [9:0] VCount;

	// Outputs
	wire [1:0] selRGB;
	wire [8:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	DrawSystem uut (
		.clk(clk), 
		.HCount(HCount), 
		.VCount(VCount), 
		.selRGB(selRGB), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		HCount = 0;
		VCount = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clk)
			#10; HCount <= 130;
				 VCount <= 65;

	end
   
	always begin
	clk <= 1; #5;
	clk <= 0; #5;
	end
endmodule

