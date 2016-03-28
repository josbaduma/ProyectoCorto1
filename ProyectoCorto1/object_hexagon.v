`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:34:55 03/28/2016 
// Design Name: 
// Module Name:    object_hexagon 
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
module object_hexagon(
    input [9:0] HCount,
    input [9:0] VCount,
    output hexagon_on
    );

///-------------Parametros del hexagono------------//
localparam hexagon_width = 200;
localparam hexagon_height = 150;

localparam hexagon_x_l = 5;
localparam hexagon_x_r = hexagon_x_l + hexagon_width - 1;

localparam hexagon_y_t = 325;
localparam hexagon_y_b = hexagon_y_t + hexagon_height - 1;

assign hexagon_sq = ((hexagon_x_l <= HCount) && (HCount <= hexagon_x_r) &&
							(hexagon_y_t <= VCount) && (VCount <= hexagon_y_b));

wire [7:0] hexagon_addr;
wire [7:0] hexagon_col;
wire [207:0] hexagon_data;

//Memoria ROM que contiene mapa de bit del hexagono
ROM_Hexagon hexagon (
	.addr(hexagon_addr),
	.data(hexagon_data)
	);
	
assign hexagon_addr = VCount[9:0] - hexagon_y_t[9:0];
assign hexagon_col = HCount[9:0] - hexagon_x_l[9:0];

assign hexagon_bit = hexagon_data[hexagon_col];
assign hexagon_on = hexagon_sq & hexagon_bit;

endmodule
