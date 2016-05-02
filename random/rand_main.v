`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:53:48 05/01/2016 
// Design Name: 
// Module Name:    rand_main 
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
module rand_main(
    input FPGA_Clk,
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
pos_generator gen(FPGA_Clk,card1X,card2Y,card3X,card4Y,card5X,card6Y,card7X,card8Y,card9X,card10Y,card11X,card12Y,
card13X,card14Y,card15X,card16Y);

Find_pos find(card1,card2,card3,card4,card5,card6,card7,card8,card9,card10,card11,card12,card13,card14,card15,card16,
card1X,card1Y,card2X,card2Y,card3X,card3Y,card4X,card4Y,card5X,card5Y,card6X,card6Y,card7X,card7Y,card8X,card8Y,card9X,
card9Y,card10X,card10Y,card11X,card11Y,card12X,card12Y,card13X,card13Y,card14X,card14Y,card15X,card15Y,card16X,card16Y);

endmodule
