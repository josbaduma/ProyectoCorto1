`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:29:57 05/12/2016
// Design Name:   Memory
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoFinal/MemoryTest.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MemoryTest;

	// Inputs
	reg clk;
	reg WE;
	reg [31:0] ADDR;
	reg [31:0] WD;

	// Outputs
	wire [31:0] RD;

	// Instantiate the Unit Under Test (UUT)
	Memory uut (
		.clk(clk), 
		.WE(WE), 
		.ADDR(ADDR), 
		.WD(WD), 
		.RD(RD)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		WE = 0;
		ADDR = 0;
		WD = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		WE = 1;
		ADDR = 45;
		WD = 32'h56;
		#50;
		WE = 0;
		ADDR = 45;
		WD = 0;
	end
      
always begin
	#5; clk = 0;
	#5; clk = 1;
end

endmodule

