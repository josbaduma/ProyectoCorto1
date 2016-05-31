`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:24:50 05/16/2016
// Design Name:   ConditionalLogic
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoFinal/CondTest.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ConditionalLogic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CondTest;

	// Inputs
	reg clk;
	reg PCs;
	reg RegW;
	reg MemW;
	reg [1:0] FlagW;
	reg [3:0] Cond;
	reg [3:0] ALUFlags;

	// Outputs
	wire PCSrc;
	wire RegWrite;
	wire MemWrite;

	// Instantiate the Unit Under Test (UUT)
	ConditionalLogic uut (
		.clk(clk), 
		.PCs(PCs), 
		.RegW(RegW), 
		.MemW(MemW), 
		.FlagW(FlagW), 
		.Cond(Cond), 
		.ALUFlags(ALUFlags), 
		.PCSrc(PCSrc), 
		.RegWrite(RegWrite), 
		.MemWrite(MemWrite)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		PCs = 0;
		RegW = 0;
		MemW = 0;
		FlagW = 0;
		Cond = 0;
		ALUFlags = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		PCs = 0;
		RegW = 1;
		MemW = 0;
		FlagW = 0;
		Cond = 14;
		ALUFlags = 0;
		#150;
		PCs = 0;
		RegW = 1;
		MemW = 0;
		FlagW = 3;
		Cond = 1;
		ALUFlags = 8;
		#150;
		PCs = 0;
		RegW = 1;
		MemW = 0;
		FlagW = 3;
		Cond = 1;
		ALUFlags = 7;
	end
	

always begin
		#5; clk = 1;
		#5; clk = 0;
end
endmodule

