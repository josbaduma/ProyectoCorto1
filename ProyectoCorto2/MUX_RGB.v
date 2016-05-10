`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:29:35 05/01/2016 
// Design Name: 
// Module Name:    MUX_RGB 
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
module MUX_RGB(
    input [2:0] rgbA,
    input [2:0] rgbB,
	 input [2:0] rgbC,
	 input [2:0] rgbD,
	 input [2:0] rgbE,
    input [2:0] rgbF,
	 input [2:0] rgbG,
	 input [2:0] rgbH,
	 input [2:0] rgbI,
    input [2:0] rgbJ,
	 input [2:0] rgbK,
	 input [2:0] rgbL,
	 input [2:0] rgbM,
    input [2:0] rgbN,
	 input [2:0] rgbO,
	 input [2:0] rgbP,
	 input [2:0] rgbtitle,
	 input [2:0] rgbmouse,
	 input [2:0] rgbnum,
	 input [2:0] rgbtext,
    input [19:0] selRGB,
    output reg [2:0] rgbnext
    );

always @*
begin
	case(selRGB)
		20'b00000000000000000000: rgbnext <= 8'b0;
		20'b00000000000000000001: rgbnext <= rgbA;
		20'b00000000000000000010: rgbnext <= rgbB;
		20'b00000000000000000100: rgbnext <= rgbC;
		20'b00000000000000001000: rgbnext <= rgbD;
		20'b00000000000000010000: rgbnext <= rgbE;
		20'b00000000000000100000: rgbnext <= rgbF;
		20'b00000000000001000000: rgbnext <= rgbG;
		20'b00000000000010000000: rgbnext <= rgbH;
		20'b00000000000100000000: rgbnext <= rgbI;
		20'b00000000001000000000: rgbnext <= rgbJ;
		20'b00000000010000000000: rgbnext <= rgbK;
		20'b00000000100000000000: rgbnext <= rgbL;
		20'b00000001000000000000: rgbnext <= rgbM;
		20'b00000010000000000000: rgbnext <= rgbN;
		20'b00000100000000000000: rgbnext <= rgbO;
		20'b00001000000000000000: rgbnext <= rgbP;
		20'b00010000000000000000: rgbnext <= rgbtitle;
		20'b00100000000000000000: rgbnext <= rgbmouse;
		20'b01000000000000000000: rgbnext <= rgbnum;
		20'b10000000000000000000: rgbnext<= rgbtext;
		default: rgbnext <= 8'b0;
	endcase
end

endmodule

