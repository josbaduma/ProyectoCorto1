`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:18:26 04/30/2016 
// Design Name: 
// Module Name:    Find_pos 
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
module Find_pos(
    input [4:0] card1,
	 input [4:0] card2,
	 input [4:0] card3,
	 input [4:0] card4,
	 input [4:0] card5,
	 input [4:0] card6,
	 input [4:0] card7,
	 input [4:0] card8,
	 input [4:0] card9,
	 input [4:0] card10,
	 input [4:0] card11,
	 input [4:0] card12,
	 input [4:0] card13,
	 input [4:0] card14,
	 input [4:0] card15,
	 input [4:0] card16,
    output [9:0] card1X,
	 output [9:0] card1Y,
	 output [9:0] card2X,
	 output [9:0] card2Y,
	 output [9:0] card3X,
	 output [9:0] card3Y,
	 output [9:0] card4X,
	 output [9:0] card4Y,
	 output [9:0] card5X,
	 output [9:0] card5Y,
	 output [9:0] card6X,
	 output [9:0] card6Y,
	 output [9:0] card7X,
	 output [9:0] card7Y,
	 output [9:0] card8X,
	 output [9:0] card8Y,
	 output [9:0] card9X,
	 output [9:0] card9Y,
	 output [9:0] card10X,
	 output [9:0] card10Y,
	 output [9:0] card11X,
	 output [9:0] card11Y,
	 output [9:0] card12X,
	 output [9:0] card12Y,
	 output [9:0] card13X,
	 output [9:0] card13Y,
	 output [9:0] card14X,
	 output [9:0] card14Y,
	 output [9:0] card15X,
	 output [9:0] card15Y,
	 output [9:0] card16X,
	 output [9:0] card16Y
    );
//internal var 
reg [9:0] posX [0:17];
reg [9:0] posY [0:17];

initial
begin 
posX[1] = 60;
posX[2] = 60;
posX[3] = 60;
posX[4] = 60;
posX[5] = 160;
posX[6] = 160;
posX[7] = 160;
posX[8] = 160;
posX[9] = 260;
posX[10] = 260;
posX[11] = 260;
posX[12] = 260;
posX[13] = 360;
posX[14] = 360;
posX[15] = 360;
posX[16] = 360;
posY[1] = 121;
posY[2] = 221;
posY[3] = 321;
posY[4] = 421;
posY[5] = 121;
posY[6] = 221;
posY[7] = 321;
posY[8] = 421;
posY[9] = 121;
posY[10] = 221;
posY[11] = 321;
posY[12] = 421;
posY[13] = 121;
posY[14] = 221;
posY[15] = 321;
posY[16] = 421;

end  
assign card1X = posX[card1];
assign card1Y = posY[card1];
assign card2X = posX[card2];
assign card2Y = posY[card2];
assign card3X = posX[card3];
assign card3Y = posY[card3];
assign card4X = posX[card4];
assign card4Y = posY[card4];
assign card5X = posX[card5];
assign card5Y = posY[card5];
assign card6X = posX[card6];
assign card6Y = posY[card6];
assign card7X = posX[card7];
assign card7Y = posY[card7];
assign card8X = posX[card8];
assign card8Y = posY[card8];
assign card9X = posX[card9];
assign card9Y = posY[card9];
assign card10X = posX[card10];
assign card10Y = posY[card10];
assign card11X = posX[card11];
assign card11Y = posY[card11];
assign card12X = posX[card12];
assign card12Y = posY[card12];
assign card13X = posX[card13];
assign card13Y = posY[card13];
assign card14X = posX[card14];
assign card14Y = posY[card14];
assign card15X = posX[card15];
assign card15Y = posY[card15];
assign card16X = posX[card16];
assign card16Y = posY[card16];

endmodule
