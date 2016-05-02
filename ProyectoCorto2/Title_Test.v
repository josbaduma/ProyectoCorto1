`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:07:41 05/02/2016
// Design Name:   TitleText
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/Title_Test.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TitleText
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Title_Test;

	// Inputs
	reg [9:0] HCount;
	reg [9:0] VCount;

	// Outputs
	wire titleon;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	TitleText uut (
		.HCount(HCount), 
		.VCount(VCount),
		.titleon(titleon), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		HCount = 0;
		VCount = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#5; HCount <= 226;
			 VCount <= 6;
		#5; HCount <= 226;
			 VCount <= 20;

	end
      
endmodule

