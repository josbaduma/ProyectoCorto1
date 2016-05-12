`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:20:01 05/12/2016
// Design Name:   ProgramCounter
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoFinal/PC_Test.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProgramCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_Test;

	// Inputs
	reg clk;
	reg [31:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	ProgramCounter uut (
		.clk(clk), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#3; in = 23;
		#20; in = 45;

	end
always begin
	#5; clk = 0;
	#5; clk = 1;
end
endmodule

