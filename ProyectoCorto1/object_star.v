`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:45:02 03/28/2016 
// Design Name: 
// Module Name:    object_star 
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
module object_star(
    input [9:0] HCount,
    input [9:0] VCount,
    output star_on
    );

///-------------Parametros de la estrella ------------//
localparam star_width = 200;
localparam star_height = 150;

localparam star_x_l = 430;
localparam star_x_r = star_x_l + star_width - 1;

localparam star_y_t = 325;
localparam star_y_b = star_y_t + star_height - 1;

assign star_sq = ((star_x_l <= HCount) && (HCount <= star_x_r) &&
							(star_y_t <= VCount) && (VCount <= star_y_b));

wire [7:0] star_addr;
wire [7:0] star_col;
wire [207:0] star_data;

//Memoria ROM que contiene mapa de bit de la estrella
ROM_Star star (
	.addr(star_addr),
	.data(star_data)
	);
	
assign star_addr = VCount[9:0] - star_y_t[9:0];
assign star_col = HCount[9:0] - star_x_l[9:0];

assign star_bit = star_data[star_col];
assign star_on = star_sq & star_bit;

endmodule
