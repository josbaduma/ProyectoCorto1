`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:55:45 05/09/2016
// Design Name:   MouseAlt
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/Mouse.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MouseAlt
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mouse;

	// Inputs
	reg clk;
	reg up0;
	reg down0;
	reg left0;
	reg right0;
	reg select0;

	// Outputs
	wire Click;
	wire [9:0] posMX;
	wire [9:0] posMY;

	// Instantiate the Unit Under Test (UUT)
	MouseAlt uut (
		.clk(clk), 
		.up0(up0), 
		.down0(down0), 
		.left0(left0), 
		.right0(right0), 
		.select0(select0), 
		.Click(Click), 
		.posMX(posMX), 
		.posMY(posMY)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		up0 = 0;
		down0 = 0;
		left0 = 0;
		right0 = 0;
		select0 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#50; down0 = 1;
		#50; down0 = 0;
		#50; right0 = 1;
		#50; right0 = 0;

	end
always begin
	#5; clk = 1;
	#5; clk = 0;
end
      
endmodule

