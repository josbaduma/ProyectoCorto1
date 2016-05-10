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
	 input up0,
	 input down0,
	 input left0,
	 input right0,
	 input select0,
    output wire HSync,
    output wire VSync,
	 output wire [2:0] rgb
    );

wire PixelCLK;
wire [9:0] HCount, VCount;	 
wire [3:0] selNum;
wire [15:0] regCard;
wire [9:0] posMX, posMY;
reg [4:0] posA, posB, posC, posD, posE, posF, posG, posH, posI, posJ, posK, posL, posM, posN, posO, posP;
wire [4:0] card;
	
//pos_generator random (
//	.clk(clk), 
//   .card1(posA), 
//   .card2(posB), 
//   .card3(posC), 
//   .card4(posD), 
//   .card5(posE), 
//   .card6(posF), 
//   .card7(posG), 
//   .card8(posH), 
//   .card9(posI), 
//   .card10(posJ), 
//   .card11(posK), 
//   .card12(posL), 
//   .card13(posM), 
//   .card14(posN), 
//   .card15(posO), 
//   .card16(posP)
//);
	
FreqDivisor freq (
	.clk(clk),
	.rst(rst),
	.PixelCLK(PixelCLK)
);

MouseAlt mouse (
    .clk(clk), 
    .up0(up0), 
    .down0(down0), 
    .left0(left0), 
    .right0(right0), 
    .select0(select0), 
    .Click(Click), 
    .posMX(posMX), 
    .posMY(posMY)
    );

mouse_val cardSel (
    .Click(Click), 
    .Mouse_x(posMX), 
    .Mouse_y(posMY), 
    .card1(posA), 
    .card2(posB), 
    .card3(posC), 
    .card4(posD), 
    .card5(posE), 
    .card6(posF), 
    .card7(posG), 
    .card8(posH), 
    .card9(posI), 
    .card10(posJ), 
    .card11(posK), 
    .card12(posL), 
    .card13(posM), 
    .card14(posN), 
    .card15(posO), 
    .card16(posP), 
    .card(card)
    );

MemoryFSM fsm (
	.clk(PixelCLK),
	.rst(rst),
	.value(card),
	.selNum(selNum),
	.cardreg(regCard)
	);

VGA_Controller vga_sync (
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
	.regCard(regCard),
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
	.posMX(posMX),
	.posMY(posMY),
	.numSel(selNum),
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
