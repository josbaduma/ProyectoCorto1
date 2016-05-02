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
    input [8:0] rgbA,
    input [8:0] rgbB,
	 input [8:0] rgbC,
	 input [8:0] rgbD,
	 input [8:0] rgbE,
    input [8:0] rgbF,
	 input [8:0] rgbG,
	 input [8:0] rgbH,
	 input [8:0] rgbI,
    input [8:0] rgbJ,
	 input [8:0] rgbK,
	 input [8:0] rgbL,
	 input [8:0] rgbM,
    input [8:0] rgbN,
	 input [8:0] rgbO,
	 input [8:0] rgbP,
    input [15:0] selRGB,
    output reg [8:0] rgbnext
    );

always @*
begin
	case(selRGB)
		16'b0000000000000000: rgbnext <= 8'b0;
		16'b0000000000000001: rgbnext <= rgbA;
		16'b0000000000000010: rgbnext <= rgbB;
		16'b0000000000000100: rgbnext <= rgbC;
		16'b0000000000001000: rgbnext <= rgbD;
		16'b0000000000010000: rgbnext <= rgbE;
		16'b0000000000100000: rgbnext <= rgbF;
		16'b0000000001000000: rgbnext <= rgbG;
		16'b0000000010000000: rgbnext <= rgbH;
		16'b0000000100000000: rgbnext <= rgbI;
		16'b0000001000000000: rgbnext <= rgbJ;
		16'b0000010000000000: rgbnext <= rgbK;
		16'b0000100000000000: rgbnext <= rgbL;
		16'b0001000000000000: rgbnext <= rgbM;
		16'b0010000000000000: rgbnext <= rgbN;
		16'b0100000000000000: rgbnext <= rgbO;
		16'b1000000000000000: rgbnext <= rgbP;
		default: rgbnext <= 0;
	endcase
end

endmodule
