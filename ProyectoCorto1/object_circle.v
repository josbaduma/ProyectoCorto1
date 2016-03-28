`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:33 03/27/2016 
// Design Name: 
// Module Name:    object_circle 
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
module object_circle(
    input [9:0] HCount,
    input [9:0] VCount,
    output circle_on
    );

localparam circle_width = 200;
localparam circle_height = 150;

localparam circle_x_l = 5;
localparam circle_x_r = circle_x_l + circle_width - 1;

localparam circle_y_t = 5;
localparam circle_y_b = circle_y_t + circle_height - 1;

assign circle_sq = ((circle_x_l <= HCount) && (HCount <= circle_x_r) &&
							(circle_y_t <= VCount) && (VCount <= circle_y_b));

wire [7:0] circle_addr;
wire [7:0] circle_col;
wire [207:0] circle_data;

//Memoria ROM que contiene mapa de bit del triangulo
ROM_Circle circle (
	.addr(circle_addr),
	.data(circle_data)
	);
	
assign circle_addr = VCount[9:0] - circle_y_t[9:0];
assign circle_col = HCount[9:0] - circle_x_l[9:0];

assign circle_bit = circle_data[circle_col];
assign circle_on = circle_sq & circle_bit;

endmodule
