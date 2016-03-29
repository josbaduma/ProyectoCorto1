`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:20:25 03/27/2016 
// Design Name: 
// Module Name:    object_rectangle 
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
module object_rectangle(
    input [9:0] HCount,
    input [9:0] VCount,
	 input rectangle_select,
    output rectangle_on
    );

//------------Parametros del rectangulo-----------//
localparam rectangle_width = 160;
localparam rectangle_height = 115;

localparam rectangle_x_l = 240;
localparam rectangle_x_r = rectangle_x_l + rectangle_width - 1;

localparam rectangle_y_t = 178;
localparam rectangle_y_b = rectangle_y_t + rectangle_height - 1;

assign rectangle_on = ((rectangle_x_l <= HCount) && (HCount <= rectangle_x_r) &&
							  (rectangle_y_t <= VCount) && (VCount <= rectangle_y_b));

endmodule
