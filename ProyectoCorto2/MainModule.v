`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:24:01 04/07/2016 
// Design Name: 
// Module Name:    MainModule 
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
module MainModule(
    input clk,
	 input rst,
    output wire HSync,
    output wire VSync,
	 output wire [2:0] rgb
    );

wire PixelCLK;
wire [9:0] HCount, VCount;	 
reg [3:0] posA, posB, posC, posD, posE, posF, posG, posH, posI, posJ, posK, posL, posM, posN, posO, posP;
	 
FreqDivisor freq (
	.clk(clk),
	.rst(rst),
	.PixelCLK(PixelCLK)
);

VGA_Controller vga (
	.clk(PixelCLK),
	.rst(rst),
	.HCount(HCount),
	.VCount(VCount),
	.HSync(HSync),
	.VSync(VSync)
);

//Modulo de actualizacion de RGB
DrawSystem draw (
	.HCount(HCount),
	.VCount(VCount),
	.posA(posA),
	.posB(posB),
	.posC(posC),
	.posD(posD),
	.posE(posE),
	.posF(posF),
	.posG(posG),
	.posH(posH),
	.posI(posI),
	.posJ(posJ),
	.posK(posK),
	.posL(posL),
	.posM(posM),
	.posN(posN),
	.posO(posO),
	.posP(posP),
	.rgb(rgb)
	);

always @(posedge PixelCLK) begin
	posA <= 3;
	posB <= 15;
	posC <= 4;
	posD <= 11;
	posE <= 1;
	posF <= 10;
	posG <= 7;
	posH <= 14;
	posI <= 9;
	posJ <= 5;
	posK <= 8;
	posL <= 0;
	posM <= 2;
	posN <= 12;
	posO <= 13;
	posP <= 6;
end

endmodule
