`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:55:41 05/11/2016 
// Design Name: 
// Module Name:    ARM_Processor 
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
module ARM_Processor(
	 input clk
    );
	 
wire [31:0] PC, ExtImm, RD;

ProgramCounter pc (
	 .clk(clk),
	 .in(PCin),
	 .out(PC)
	 );

InstructionMemory insructions (
    .ADDR(PC), 
    .RD(RD)
    );

Registers regbank (
	 .clk(clk), 
    .WE3(WE3), 
    .ADDR1(RD[19:16]), 
    .ADDR2(ADDR2), 
    .ADDR3(ADDR3), 
    .WD3(WD3), 
    .RD1(RD1), 
    .RD2(RD2), 
    .R15(P15)
	 );

ExtendImm imm (
	 .Immediate(RD[11:0]),
	 .ExtImm(ExtImm)
	 );

Memory mem (
	 .clk(clk), 
    .WE(WE), 
    .ADDR(ADDR), 
    .WD(WD), 
    .RD(RD)
	 );


endmodule
