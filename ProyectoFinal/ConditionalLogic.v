`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:03 05/16/2016 
// Design Name: 
// Module Name:    ConditionalLogic 
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
module ConditionalLogic(
	 input clk,
    input PCs,
    input RegW,
    input MemW,
    input [1:0] FlagW,
    input [3:0] Cond,
    input [3:0] ALUFlags,
    output reg PCSrc,
    output reg RegWrite,
    output reg MemWrite
    );

reg [1:0] FlagA, FlagB;
reg [1:0] FlagWrite;
wire CondEx;

initial begin
	FlagA = 0;
	FlagB = 0;
end

CondCheck check (
	 .Cond(Cond),
	 .FlagA(FlagA),
	 .FlagB(FlagB),
	 .CondEx(CondEx)
	 );

always @* begin
	FlagWrite[1] = (FlagW[1] & CondEx);
	FlagWrite[0] = (FlagW[0] & CondEx);
	PCSrc = (PCs & CondEx);
	RegWrite = (RegW & CondEx);
	MemWrite = (MemW & CondEx);
end

always @(posedge clk) begin
	if(FlagWrite[1])
		FlagA <= ALUFlags[3:2];
	if(FlagWrite[0])
		FlagB <= ALUFlags[1:0];
end

endmodule
