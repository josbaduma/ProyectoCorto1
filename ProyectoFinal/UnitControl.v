`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:27:28 05/16/2016 
// Design Name: 
// Module Name:    UnitControl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module UnitControl(
	 input clk,
    input [3:0] Cond,
    input [1:0] OP,
    input [5:0] Funct,
    input [3:0] RD,
	 input Zero,
	 input Negative,
	 input Carry,
	 input Overflow,
    output PCSrc,
    output MemtoReg,
    output MemWrite,
    output ALUSrc,
    output RegWrite,
	 output [1:0] RegSrc,
    output [1:0] ImmSrc,
    output [1:0] ALUControl
    );

wire PCs, RegW, MemW;
wire [1:0] FlagW;
reg [3:0] ALUFlags;

Decoder deco (
	 .Rd(RD), 
    .Op(OP), 
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

ConditionalLogic condlogic (
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
	 
always @* begin
	ALUFlags = {Zero, Negative, Carry, Overflow};
end

endmodule
