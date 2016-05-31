`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:27:12 05/16/2016
// Design Name:   Decoder
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoFinal/deco_test.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module deco_test;

	// Inputs
	reg [3:0] Rd;
	reg [1:0] Op;
	reg [5:0] Funct;

	// Outputs
	wire PCs;
	wire RegW;
	wire MemW;
	wire MemtoReg;
	wire ALUSrc;
	wire [1:0] ImmSrc;
	wire [1:0] RegSrc;
	wire [1:0] ALUControl;
	wire [1:0] FlagW;

	// Instantiate the Unit Under Test (UUT)
	Decoder uut (
		.Rd(Rd), 
		.Op(Op), 
		.Funct(Funct), 
		.PCs(PCs), 
		.RegW(RegW), 
		.MemW(MemW), 
		.MemtoReg(MemtoReg), 
		.ALUSrc(ALUSrc), 
		.ImmSrc(ImmSrc), 
		.RegSrc(RegSrc), 
		.ALUControl(ALUControl), 
		.FlagW(FlagW)
	);

	initial begin
		// Initialize Inputs
		Rd = 0;
		Op = 0;
		Funct = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Rd = 7;
		Op = 0;
		Funct = 8;
	end
      
endmodule

