`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:37:47 05/02/2016
// Design Name:   CardA
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/CardA_Test.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CardA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CardA_Test;

	// Inputs
	reg [3:0] pos;
	reg enable;
	reg [9:0] HCount;
	reg [9:0] VCount;

	// Outputs
	wire cardon;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	CardA uut (
		.pos(pos), 
		.enable(enable), 
		.HCount(HCount), 
		.VCount(VCount), 
		.cardon(cardon), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		pos = 0;
		enable = 0;
		HCount = 0;
		VCount = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10;
		pos = 0;
		enable = 0;
		HCount = 135;
		VCount = 75;
		
		#50;
		pos = 0;
		enable = 1;
		HCount = 135;
		VCount = 75;
	end
      
endmodule

