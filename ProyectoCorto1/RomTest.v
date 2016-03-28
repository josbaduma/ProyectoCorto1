`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:42:56 03/27/2016
// Design Name:   ROM_Triangle
// Module Name:   C:/XilinxProjects/ProyectoCorto1/RomTest.v
// Project Name:  ProyectoCorto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ROM_Triangle
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RomTest;

	// Inputs
	reg [7:0] addr;

	// Outputs
	wire [207:0] data;

	// Instantiate the Unit Under Test (UUT)
	ROM_Triangle uut (
		.addr(addr), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		addr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#30; addr = 123;
		#30; addr = 69;
	end
      
endmodule

