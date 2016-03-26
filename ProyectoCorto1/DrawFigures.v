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

//------------Parametros del triangulo-----------//
localparam triangle_width = 125;
localparam triangle_height = 125;

localparam triangle_x_l = 255;
localparam triangle_x_r = triangle_x_l + triangle_width - 1;

localparam triangle_y_t = 338;
localparam triangle_y_b = triangle_y_t + triangle_height - 1;

assign triangle_on = ((triangle_x_l <= HCount) && (HCount <= triangle_x_r) &&
							  (triangle_y_t <= VCount) && (VCount <= triangle_y_b));

//------------Parametros del circulo-----------//
localparam circle_radio = 60;
localparam circle_x = 105;
localparam circle_y = 80;

localparam circle_x_l = 46;
localparam circle_x_r = circle_x_l + 2*circle_radio - 1;

localparam circle_y_t = 20;
localparam circle_y_b = circle_y_t + 2*circle_radio - 1;

assign circle_eq = ( ((HCount - circle_x)*(HCount - circle_x)) + ((VCount - circle_y)*(VCount - circle_y)) 
								<= (circle_radio*circle_radio));
assign circle_bd = ((circle_x_l <= HCount) && (HCount <= circle_x_r) &&
						  (circle_y_t <= VCount) && (VCount <= circle_y_b));
assign circle_on = (circle_eq && circle_bd);
							  
//------------Parametros de los bordes-----------//

assign bordeA = ((212 <= HCount) && (HCount <= 214));
assign bordeB = ((426 <= HCount) && (HCount <= 428));
assign bordeC = ((158 <= VCount) && (VCount <= 161));
assign bordeD = ((319 <= VCount) && (VCount <= 322));

assign borde_on = (bordeA || bordeB || bordeC || bordeD);
							  
//------------Selector de los colores------------//
always @*
begin
	if( square_on )
		rgb <= 3'b001;
	else if(rectangle_on)
		rgb <=3'b001;
	else if(triangle_on)
		rgb <=3'b001;
	else if(circle_on)
		rgb <=3'b001;
	else if(borde_on)
		rgb <=3'b110;
	else
		rgb <= 3'b000;
end

endmodule
