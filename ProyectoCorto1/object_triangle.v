`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:12:11 03/27/2016 
// Design Name: 
// Module Name:    object_triangle 
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
module object_triangle(
    input [9:0] HCount,
    input [9:0] VCount,
	 input triangle_select,
    output triangle_on
    );

///-------------Parametros del triangulo------------//
localparam triangle_width = 200;
localparam triangle_height = 145;

localparam triangle_x_l = 434;
localparam triangle_x_r = triangle_x_l + triangle_width - 1;

localparam triangle_y_t = 6;
localparam triangle_y_b = triangle_y_t + triangle_height - 1;

assign triangle_sq = ((triangle_x_l <= HCount) && (HCount <= triangle_x_r) &&
							(triangle_y_t <= VCount) && (VCount <= triangle_y_b));

wire [7:0] triangle_addr;
wire [7:0] triangle_col;
wire [207:0] triangle_data;

//Memoria ROM que contiene mapa de bit del triangulo
ROM_Triangle triangle (
	.addr(triangle_addr),
	.data(triangle_data)
	);
	
assign triangle_addr = VCount[9:0] - triangle_y_t[9:0];
assign triangle_col = HCount[9:0] - triangle_x_l[9:0];

assign triangle_bit = triangle_data[triangle_col];
assign triangle_on = triangle_sq & triangle_bit;

endmodule
