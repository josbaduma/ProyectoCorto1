`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:32:11 05/09/2016
// Design Name:   Mouse_Alt
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/MouseTest.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mouse_Alt
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MouseTest;

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
	Mouse_Alt uut (
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
		#10; up0 = 1;
		#10; up0 = 0;
		#10; down0 = 1;
		#10; down0 = 0;
		#10; left0 = 1;
		#10; left0 = 0;
		#10; right0 = 1;
		#10; right0 = 0;
		#10; select0 = 1;
		#10; select0 = 0;
	end
      
always begin
	#1; clk = 1;
	#1; clk = 0;
end

endmodule

