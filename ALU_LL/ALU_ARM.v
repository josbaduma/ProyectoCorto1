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
Adder(A,selB,Sum,Cout);
AND and32(A,B,AND);
OR or32(A,B,OR);
Deco(Sum,Sum,AND,OR,ALUControl,Result);
//not n1(Result[31],Zero);///ojo
not n2(ALUControl[1], nAlC);
and a1(nAlC,Cout,Carry);
xor x1(Sum[31], A[31],xorAS);
xnor xn1(ALUControl[0],A[31],B[31], xnorAlcAB);
and a2(xorAS,xnorAlcAB,nAlC,Overflow);
not n3(Result[31], nr31);
not n4(nr31, Negative);
not n5(Result[31], nr312);
and(nr312,Zero)
//assign Negative = Result[31];
//assign Zero = (Result == 0)? 1'b1;
endmodule
