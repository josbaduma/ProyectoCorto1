`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:59:27 03/31/2016
// Design Name:   object_square
// Module Name:   C:/XilinxProjects/ProyectoCorto1/square_test.v
// Project Name:  ProyectoCorto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: object_square
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module square_test;

	// Inputs
	reg [9:0] HCount;
	reg [9:0] VCount;
	reg square_select;
	reg full_screen;

	// Outputs
	wire square_on;

	// Instantiate the Unit Under Test (UUT)
	object_square uut (
		.HCount(HCount), 
		.VCount(VCount), 
		.square_select(square_select), 
		.full_screen(full_screen), 
		.square_on(square_on)
	);

	initial begin
		// Initialize Inputs
		HCount = 0;
		VCount = 0;
		square_select = 0;
		full_screen = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#40; full_screen = 0; square_select = 1; HCount = 9'd280; VCount = 9'd60;
		#40; full_screen = 1; square_select = 1; HCount = 9'd280; VCount = 9'd185;
		#40; full_screen = 1; square_select = 0; HCount = 9'd280; VCount = 9'd185;
	end
      
endmodule

