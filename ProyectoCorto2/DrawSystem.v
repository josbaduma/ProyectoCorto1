`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:45:16 04/14/2016 
// Design Name: 
// Module Name:    DrawSystem 
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
module DrawSystem(
    input [9:0] HCount,
    input [9:0] VCount,
	 input [3:0] posA, posB, posC, posD, posE, posF, posG, posH, posI, posJ, posK, posL, posM, posN, posO, posP,
	 output reg [16:0] selRGB,
    output reg [2:0] rgb
    );

//reg [16:0] selRGB;
wire cardAon, cardBon, cardCon,cardDon, cardEon, cardFon, cardGon,cardHon, cardIon, cardJon, cardKon,cardLon, cardMon, cardNon, cardOon, cardPon, titleon;
wire [2:0] rgbA, rgbB, rgbC, rgbD, rgbE, rgbF, rgbG, rgbH, rgbI, rgbJ, rgbK, rgbL, rgbM, rgbN, rgbO, rgbP, rgbtitle, rgbnext;

CardA carda (
	.enable(),
	.pos(posA),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardAon),
	.rgb(rgbA)
	);

CardB cardb (
	.enable(),
	.pos(posB),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardBon),
	.rgb(rgbB)
	);

CardC cardc (
	.enable(),
	.pos(posC),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardCon),
	.rgb(rgbC)
	);

CardD cardd (
	.enable(),
	.pos(posD),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardDon),
	.rgb(rgbD)
	);

CardE carde (
	.enable(),
	.pos(posE),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardEon),
	.rgb(rgbE)
	);
	
CardF cardf (
	.enable(),
	.pos(posF),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardFon),
	.rgb(rgbF)
	);
	
CardG cardg (
	.enable(),
	.pos(posG),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardGon),
	.rgb(rgbG)
	);
	
CardH cardh (
	.enable(),
	.pos(posH),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardHon),
	.rgb(rgbH)
	);

CardI cardi (
	.enable(),
	.pos(posI),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardIon),
	.rgb(rgbI)
	);

CardJ cardj (
	.enable(),
	.pos(posJ),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardJon),
	.rgb(rgbJ)
	);

CardK cardk (
	.enable(),
	.pos(posK),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardKon),
	.rgb(rgbK)
	);

CardL cardl (
	.enable(),
	.pos(posL),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardLon),
	.rgb(rgbL)
	);

CardM cardm (
	.enable(),
	.pos(posM),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardMon),
	.rgb(rgbM)
	);
	
CardN cardn (
	.enable(),
	.pos(posN),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardNon),
	.rgb(rgbN)
	);
	
CardO cardo (
	.enable(),
	.pos(posO),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardOon),
	.rgb(rgbO)
	);
	
CardP cardp (
	.enable(),
	.pos(posP),
	.HCount(HCount),
	.VCount(VCount),
	.cardon(cardPon),
	.rgb(rgbP)
	);

TitleText title (
	.HCount(HCount),
	.VCount(VCount),
	.titleon(titleon),
	.rgb(rgbtitle)
	);
	
MUX_RGB mux (
	.rgbA(rgbA),
	.rgbB(rgbB),
	.rgbC(rgbC),
	.rgbD(rgbD),
	.rgbE(rgbE),
	.rgbF(rgbF),
	.rgbG(rgbG),
	.rgbH(rgbH),
	.rgbI(rgbI),
	.rgbJ(rgbJ),
	.rgbK(rgbK),
	.rgbL(rgbL),
	.rgbM(rgbM),
	.rgbN(rgbN),
	.rgbO(rgbO),
	.rgbP(rgbP),
	.rgbtitle(rgbtitle),
	.selRGB(selRGB),
	.rgbnext(rgbnext)
	);
	
always @*
begin
	selRGB[0] <= cardAon;
	selRGB[1] <= cardBon;
	selRGB[2] <= cardCon;
	selRGB[3] <= cardDon;
	selRGB[4] <= cardEon;
	selRGB[5] <= cardFon;
	selRGB[6] <= cardGon;
	selRGB[7] <= cardHon;
	selRGB[8] <= cardIon;
	selRGB[9] <= cardJon;
	selRGB[10] <= cardKon;
	selRGB[11] <= cardLon;
	selRGB[12] <= cardMon;
	selRGB[13] <= cardNon;
	selRGB[14] <= cardOon;
	selRGB[15] <= cardPon;
	selRGB[16] <= titleon;
	rgb <= rgbnext;
end

endmodule
