`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:35 05/06/2016 
// Design Name: 
// Module Name:    MouseRGB 
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
module MouseRGB(
    input [9:0] posMX,
    input [9:0] posMY,
	 input [9:0] HCount,
	 input [9:0] VCount,
    output reg mouseon,
    output reg [2:0] rgbmouse
    );

localparam width = 20;
localparam height = 30;

reg [9:0] pos_x_r;
reg [9:0] pos_y_b;

reg [4:0] addr;
reg [9:0] col;
reg [19:0] data;
reg mouse_sq;

always @* begin
	case(addr)
		5'h0: data = 20'b00000000000000000111;
		5'h1: data = 20'b00000000000000001111;
		5'h2: data = 20'b00000000000000011111;
		5'h3: data = 20'b00000000000001111111;
		5'h4: data = 20'b00000000000011111111;
		5'h5: data = 20'b00000000000111111111;
		5'h6: data = 20'b00000000001111111111;
		5'h7: data = 20'b00000000111111111111;
		5'h8: data = 20'b00000001111111111111;
		5'h9: data = 20'b00000011111111111111;
		5'ha: data = 20'b00001111111111111111;
		5'hb: data = 20'b00011111111111111111;
		5'hc: data = 20'b00111111111111111111;
		5'hd: data = 20'b01111111111111111111;
		5'he: data = 20'b11111111111111111111;
		5'hf: data = 20'b11111111111111111111;
		5'h10: data = 20'b11111111111111111111;
		5'h11: data = 20'b00011111111111111111;
		5'h12: data = 20'b00000001111111111111;
		5'h13: data = 20'b00000011111111111111;
		5'h14: data = 20'b00000011111111111111;
		5'h15: data = 20'b00000111111110011111;
		5'h16: data = 20'b00000111111100001111;
		5'h17: data = 20'b00001111111100000111;
		5'h18: data = 20'b00011111111000000011;
		5'h19: data = 20'b00011111111000000000;
		5'h1a: data = 20'b00111111110000000000;
		5'h1b: data = 20'b00111111100000000000;
		5'h1c: data = 20'b00111111100000000000;
		5'h1d: data = 20'b00001111000000000000;
	endcase
end

always @* begin
	pos_x_r = (posMX + width - 1);
	pos_y_b = (posMY + height - 1);

	mouse_sq = ((posMX <= HCount) && (HCount <= pos_x_r) &&
					(posMY <= VCount) && (VCount <= pos_y_b));
					
	addr = VCount[9:0] - posMY[9:0];
	col = HCount[9:0] - posMX[9:0];	

	mouseon = mouse_sq & data[col];
	
	rgbmouse = 3'b110;
end

endmodule
