`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:39:56 05/12/2016
// Design Name:   Registers
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoFinal/RegisterTest.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Registers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegisterTest;

	// Inputs
	reg clk;
	reg WE3;
	reg [4:0] ADDR1;
	reg [4:0] ADDR2;
	reg [4:0] ADDR3;
	reg [31:0] WD3;
	reg [31:0] R15;

	// Outputs
	wire [31:0] RD1;
	wire [31:0] RD2;

	// Instantiate the Unit Under Test (UUT)
	Registers uut (
		.clk(clk), 
		.WE3(WE3), 
		.ADDR1(ADDR1), 
		.ADDR2(ADDR2), 
		.ADDR3(ADDR3), 
		.WD3(WD3), 
		.RD1(RD1), 
		.RD2(RD2), 
		.R15(R15)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		WE3 = 0;
		ADDR1 = 0;
		ADDR2 = 0;
		ADDR3 = 0;
		WD3 = 0;
		R15 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		WE3 = 1;
		ADDR1 = 0;
		ADDR2 = 0;
		ADDR3 = 2;
		WD3 = 32'h56;
		R15 = 0;
		
		#50;
		WE3 = 1;
		ADDR1 = 0;
		ADDR2 = 0;
		ADDR3 = 6;
		WD3 = 32'h68;
		R15 = 0;
		
		#50;
		WE3 = 0;
		ADDR1 = 2;
		ADDR2 = 6;
		ADDR3 = 0;
		WD3 = 0;
		R15 = 0;
	end

always begin
	#5; clk = 0;
	#5; clk = 1;
end
   
endmodule

