`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:47:54 05/17/2016
// Design Name:   UnitControl
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoFinal/UControl_test.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UnitControl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UControl_test;

	// Inputs
	reg clk;
	reg [3:0] Cond;
	reg [1:0] OP;
	reg [5:0] Funct;
	reg [3:0] RD;
	reg Zero;
	reg Negative;
	reg Carry;
	reg Overflow;

	// Outputs
	wire PCSrc;
	wire MemtoReg;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	wire [1:0] RegSrc;
	wire [1:0] ImmSrc;
	wire [1:0] ALUControl;

	// Instantiate the Unit Under Test (UUT)
	UnitControl uut (
		.clk(clk), 
		.Cond(Cond), 
		.OP(OP), 
		.Funct(Funct), 
		.RD(RD), 
		.Zero(Zero), 
		.Negative(Negative), 
		.Carry(Carry), 
		.Overflow(Overflow), 
		.PCSrc(PCSrc), 
		.MemtoReg(MemtoReg), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite), 
		.RegSrc(RegSrc), 
		.ImmSrc(ImmSrc), 
		.ALUControl(ALUControl)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Cond = 0;
		OP = 0;
		Funct = 0;
		RD = 0;
		Zero = 0;
		Negative = 0;
		Carry = 0;
		Overflow = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Cond = 14;
		OP = 0;
		Funct = 9;
		RD = 5;
		Zero = 1;
		Negative = 0;
		Carry = 0;
		Overflow = 0;
		
		#150;
		
		Cond = 0;
		OP = 0;
		Funct = 9;
		RD = 5;
		Zero = 0;
		Negative = 0;
		Carry = 0;
		Overflow = 0;
		
		#150;
		
		Cond = 0;
		OP = 0;
		Funct = 8;
		RD = 5;
		Zero = 1;
		Negative = 0;
		Carry = 0;
		Overflow = 0;
		
		#150;
		
		Cond = 14;
		OP = 0;
		Funct = 5;
		RD = 8;
		Zero = 1;
		Negative = 0;
		Carry = 1;
		Overflow = 0;
		
		#150;
		
		Cond = 14;
		OP = 0;
		Funct = 5;
		RD = 8;
		Zero = 0;
		Negative = 0;
		Carry = 1;
		Overflow = 0;
		
		#150;
		
		Cond = 0;
		OP = 0;
		Funct = 5;
		RD = 8;
		Zero = 1;
		Negative = 0;
		Carry = 1;
		Overflow = 0;
	end

always begin
#5; clk=1;
#5; clk=0;
end
endmodule

