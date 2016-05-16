`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:31 05/14/2016 
// Design Name: 
// Module Name:    ALU_ARM 
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
module ALU_ARM(
    input[31:0] A,
    input[31:0] B,
    input[1:0] ALUControl,
    output[31:0] Result,
    output Zero,
    output Negative,
    output Carry,
    output Overflow
    );
//internal var
wire[31:0] nB,selB,Sum, AND, OR;
wire Cout, nAlC, xorAS, xnorAlcAB,nr31,nr312;

//code
Neg neg(B,nB);
Dec_Sub decS(ALUControl[0],B,nB,selB);	 
Adder adder(A,selB,Sum,Cout);
AND and32(A,B,AND);
OR or32(A,B,OR);
Deco dec(Sum,Sum,AND,OR,ALUControl,Result);

not n2(nAlC,ALUControl[1]);
and a1(Carry,nAlC,Cout);
xor x1(xorAS,Sum[31], A[31]);
xnor xn1(xnorAlcAB, ALUControl[0],A[31],B[31]);
and a2(Overflow,xorAS,xnorAlcAB,nAlC);
not n3(nr31,Result[31]);
not n4(Negative,nr31);
not n5(nr312,Result[31]);
and(Zero,nr312);

endmodule
