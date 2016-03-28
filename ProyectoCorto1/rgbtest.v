`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:54:45 03/27/2016
// Design Name:   DrawFigures
// Module Name:   C:/XilinxProjects/ProyectoCorto1/rgbtest.v
// Project Name:  ProyectoCorto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DrawFigures
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rgbtest;

	// Inputs
	reg [9:0] HCount;
	reg [9:0] VCount;

	// Outputs
	wire [2:0] rgb;
	wire [207:0] data;

	// Instantiate the Unit Under Test (UUT)
	DrawFigures uut (
		.HCount(HCount), 
		.VCount(VCount), 
		.rgb(rgb), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		HCount = 0;
		VCount = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#20; HCount = 480; VCount = 40;
		#20; HCount = 481; VCount = 40;
		#20; HCount = 482; VCount = 40;
		#20; HCount = 483; VCount = 40;
		#20; HCount = 483; VCount = 41;
		#20; HCount = 483; VCount = 42;
		#20; HCount = 483; VCount = 43;
	end
      
endmodule

