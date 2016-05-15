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
	 
wire [31:0] PC, REG, ExtImm, PCin, PC4, PC8, RT, RS, RD;
reg [3:0] rs, rd, rt, mux1, mux2;


MUX muxpc ();

ProgramCounter pc (
	 .clk(clk),
	 .in(PCin),
	 .out(PC)
	 );

Adder add1 (
    .DI1(PC), 
    .DI2(4), 
    .DO(PC4)
    );

MUX muxrs ();
MUX muxrt ();

InstructionMemory insructions (
    .ADDR(PC), 
    .RD(REG)
    );

Adder add2 (
    .DI1(PC4), 
    .DI2(4), 
    .DO(PC8)
    );


Registers regbank (
	 .clk(clk), 
    .WE3(WE3), 
    .ADDR1(rs), 
    .ADDR2(rt), 
    .ADDR3(rd), 
    .WD3(WD3), 
    .RD1(RS), 
    .RD2(RT), 
    .R15(PC8)
	 );

ExtendImm imm (
	 .Immediate(Immediate),
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
