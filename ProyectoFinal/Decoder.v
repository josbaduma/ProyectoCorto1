`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:01:21 05/16/2016 
// Design Name: 
// Module Name:    Decoder 
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
module Decoder(
    input [3:0] Rd,
    input [1:0] Op,
    input [5:0] Funct,
    output reg PCs,
    output reg RegW,
    output reg MemW,
    output reg MemtoReg,
    output reg ALUSrc,
    output reg [1:0] ImmSrc,
    output reg [1:0] RegSrc,
    output reg [1:0] ALUControl,
    output reg [1:0] FlagW
    );

reg ALUOp;
reg Branch;
reg [5:0] aluc;
reg [3:0] mdeco;

always @* begin
	mdeco = {Op, Funct[5], Funct[0]};
	
	casex(mdeco)
		4'b000x: begin Branch = 0; MemtoReg = 0; MemW = 0; ALUSrc = 0; ImmSrc = 2'b00; RegW = 1; RegSrc = 2'b00; ALUOp = 1; end
		4'b001x: begin Branch = 0; MemtoReg = 0; MemW = 0; ALUSrc = 1; ImmSrc = 2'b00; RegW = 1; RegSrc = 2'b00; ALUOp = 1; end
		4'b01x0: begin Branch = 0; MemtoReg = 0; MemW = 1; ALUSrc = 1; ImmSrc = 2'b01; RegW = 0; RegSrc = 2'b10; ALUOp = 0; end
		4'b01x1: begin Branch = 0; MemtoReg = 1; MemW = 0; ALUSrc = 1; ImmSrc = 2'b01; RegW = 1; RegSrc = 2'b00; ALUOp = 0; end
		4'b10xx: begin Branch = 1; MemtoReg = 0; MemW = 0; ALUSrc = 1; ImmSrc = 2'b10; RegW = 0; RegSrc = 2'b01; ALUOp = 0; end
	endcase
	
	PCs = ((Rd == 15) & RegW) | Branch;
	
	aluc = {ALUOp, Funct[4:0]};
	
	casex(aluc)
		6'b0xxxxx: begin ALUControl = 2'b00; FlagW = 2'b00; end 
		6'b101000: begin ALUControl = 2'b00; FlagW = 2'b00; end 
		6'b101001: begin ALUControl = 2'b00; FlagW = 2'b11; end 
		6'b100100: begin ALUControl = 2'b01; FlagW = 2'b00; end 
		6'b100101: begin ALUControl = 2'b01; FlagW = 2'b11; end 
		6'b100000: begin ALUControl = 2'b10; FlagW = 2'b00; end 
		6'b100001: begin ALUControl = 2'b10; FlagW = 2'b10; end 
		6'b111000: begin ALUControl = 2'b11; FlagW = 2'b00; end 
		6'b111001: begin ALUControl = 2'b11; FlagW = 2'b10; end 
	endcase
	
end

endmodule
