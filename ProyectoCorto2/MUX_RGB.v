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
    input [16:0] selRGB,
    output reg [2:0] rgbnext
    );

always @*
begin
	case(selRGB)
		17'b00000000000000000: rgbnext <= 3'b0;
		17'b00000000000000001: rgbnext <= rgbA;
		17'b00000000000000010: rgbnext <= rgbB;
		17'b00000000000000100: rgbnext <= rgbC;
		17'b00000000000001000: rgbnext <= rgbD;
		17'b00000000000010000: rgbnext <= rgbE;
		17'b00000000000100000: rgbnext <= rgbF;
		17'b00000000001000000: rgbnext <= rgbG;
		17'b00000000010000000: rgbnext <= rgbH;
		17'b00000000100000000: rgbnext <= rgbI;
		17'b00000001000000000: rgbnext <= rgbJ;
		17'b00000010000000000: rgbnext <= rgbK;
		17'b00000100000000000: rgbnext <= rgbL;
		17'b00001000000000000: rgbnext <= rgbM;
		17'b00010000000000000: rgbnext <= rgbN;
		17'b00100000000000000: rgbnext <= rgbO;
		17'b01000000000000000: rgbnext <= rgbP;
		17'b10000000000000000: rgbnext <= rgbtitle;
		default: rgbnext <= 3'b0;
	endcase
end

endmodule

