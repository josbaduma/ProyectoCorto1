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
wire PCSrc, RegSrcA, RegSrcB, RegWrite,  ALUSrc,  MemWrite, MemtoReg; 
wire Zero, Negative, Carry, Overflow;
wire [1:0] ImmmSrc, ALUControl;
reg [11:0] Immediate;
reg [3:0] rs, rd, rt;
wire [3:0] RA1, RA2;


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

MUX muxra1 ( 
	 .DI1(rs), 
    .DI2(const), 
    .SelData(RegSrcA), 
    .DO(RA1));
	 
MUX muxra2 (
	 .DI1(rt), 
    .DI2(rd), 
    .SelData(RegSrcB), 
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

always @* begin
	rs <= REG[19:16];
	rt <= REG[3:0];
	rd <= REG[15:12];
	Immediate <= REG[23:0];
end

endmodule
