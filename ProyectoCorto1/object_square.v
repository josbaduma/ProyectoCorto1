`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:14:39 03/27/2016 
// Design Name: 
// Module Name:    object_square 
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
module object_square(
    input [9:0] HCount,
    input [9:0] VCount,
	 input square_select,
    output square_on
    );

///-------------Parametros del cuadrado------------//
localparam square_width = 115;
localparam square_height = 115;

localparam square_x_l = 262;
localparam square_x_r = square_x_l + square_width - 1;

localparam square_y_t = 18;
localparam square_y_b = square_y_t + square_height - 1;

assign square_on = ((square_x_l <= HCount) && (HCount <= square_x_r) &&
							(square_y_t <= VCount) && (VCount <= square_y_b));
							
endmodule
