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
	 
localparam addpc = 32'h4;
localparam const = 4'd15;
	 
wire [31:0] PC, REG, ExtImm, PCin, PC4, PC8, RT, SrcA, SrcB, ALUResult, ReadData, Result;
wire PCSrc, RegWrite,  ALUSrc,  MemWrite, MemtoReg; 
wire Zero, Negative, Carry, Overflow;
wire [1:0] ImmmSrc, ALUControl, RegSrc;
reg [11:0] Immediate;
reg [3:0] rs, rd, rt;
reg [3:0] Cond;
reg [1:0] OP;
reg [5:0] Funct;
wire [3:0] RA1, RA2;

UnitControl control (
	 .clk(clk), 
    .Cond(Cond), 
    .OP(OP), 
    .Funct(Funct), 
    .RD(rd), 
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
MUX muxpc (
	 .DI1(PC4), 
    .DI2(Result), 
    .SelData(PCSrc), 
    .DO(PCin)
	 );

ProgramCounter pc (
	 .clk(clk),
	 .in(PCin),
	 .out(PC)
	 );

AdderPC add1 (
    .DI1(PC), 
    .DI2(addpc), 
    .DO(PC4)
    );

InstructionMemory insructions (
    .ADDR(PC), 
    .RD(REG)
    );

AdderPC add2 (
    .DI1(PC4), 
    .DI2(addpc), 
    .DO(PC8)
    );

MUX_REG muxra1 ( 
	 .DI0(rs), 
    .DI1(const), 
    .SelData(RegSrc[1]), 
    .DO(RA1));
	 
MUX_REG muxra2 (
	 .DI0(rt), 
    .DI1(rd), 
    .SelData(RegSrc[0]), 
    .DO(RA2));

Registers regbank (
	 .clk(clk), 
    .WE3(RegWrite), 
    .ADDR1(RA1), 
    .ADDR2(RA2), 
    .ADDR3(rd), 
    .WD3(WD3), 
    .RD1(SrcA), 
    .RD2(RT), 
    .R15(PC8)
	 );

ExtendImm imm (
	 .CondExtend(ImmSrc),
	 .Immediate(Immediate),
	 .ExtImm(ExtImm)
	 );

MUX muxalu ( 
	 .DI1(RT), 
    .DI2(ExtImm), 
    .SelData(ALUSrc), 
    .DO(SrcB));

ALU_ARM alu (
    .A(SrcA), 
    .B(SrcB), 
    .ALUControl(ALUControl), 
    .Result(ALUResult), 
    .Zero(Zero), 
    .Negative(Negative), 
    .Carry(Carry), 
    .Overflow(Overflow)
    );

Memory mem (
	 .clk(clk), 
    .WE(MemWrite), 
    .ADDR(ALUResult), 
    .WD(RT), 
    .RD(ReadData)
	 );

MUX muxresult ( 
	 .DI1(ALUResult), 
    .DI2(ReadData), 
    .SelData(MemtoReg), 
    .DO(Result));

always begin
	Cond <= REG[31:28];
	OP <= REG[27:26];
	Funct <= REG[25:20];
	rs <= REG[19:16];
	rd <= REG[15:12];
	rt <= REG[3:0];
	Immediate <= REG[23:0];
end

endmodule
