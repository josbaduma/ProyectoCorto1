`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:49:19 03/22/2016 
// Design Name: 
// Module Name:    DrawFigures 
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
module DrawFigures(
    input [9:0] HCount,
    input [9:0] VCount,
    output reg [2:0] rgb
    );

///-------------Parametros del cuadrado------------//
localparam square_width = 125;
localparam square_height = 125;

localparam square_x_l = 255;
localparam square_x_r = square_x_l + square_width - 1;

localparam square_y_t = 18;
localparam square_y_b = square_y_t + square_height - 1;

assign square_on = ((square_x_l <= HCount) && (HCount <= square_x_r) &&
							(square_y_t <= VCount) && (VCount <= square_y_b));
//------------Parametros del rectangulo-----------//
localparam rectangle_width = 180;
localparam rectangle_height = 125;

localparam rectangle_x_l = 230;
localparam rectangle_x_r = rectangle_x_l + rectangle_width - 1;

localparam rectangle_y_t = 178;
localparam rectangle_y_b = rectangle_y_t + rectangle_height - 1;

assign rectangle_on = ((rectangle_x_l <= HCount) && (HCount <= rectangle_x_r) &&
							  (rectangle_y_t <= VCount) && (VCount <= rectangle_y_b));

//------------Selector de los colores------------//
always @*
begin
	if( square_on )
		rgb <= 3'b001;
	else if(rectangle_on)
		rgb <=3'b001;
	else
		rgb <= 3'b110;
end

endmodule
