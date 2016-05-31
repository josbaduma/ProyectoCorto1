`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:05 05/19/2016 
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
    output reg [2:0] RGB
    );
	 
reg [2:0] rgb_on;
wire nave_on, alien_on, pared_on;
wire [2:0] nave_rgb, alien_rgb, pared_rgb;

Nave nave (
	 .HCount(HCount),
	 .VCount(VCount),
	 .nave_on(nave_on),
	 .nave_rgb(nave_rgb)
	 );
	 
always @* begin
	rgb_on = {pared_on, alien_on, nave_on};
	
	case(rgb_on)
		3'b000: RGB = 3'b000;
		3'b001: RGB = nave_rgb;
		3'b010: RGB = alien_rgb;
		3'b100: RGB = pared_on;
		
		default: RGB = 3'b000;
	endcase
end
	
endmodule
