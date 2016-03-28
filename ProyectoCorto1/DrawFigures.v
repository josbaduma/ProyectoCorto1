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

wire circle_on, square_on, triangle_on, oval_on, rectangle_on;
wire diamond_on, pentagon_on, hexagon_on, star_on;

//------Modulos para cada objeto que se dibuja -------//
object_circle circle ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.circle_on(circle_on));
	
object_square square ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.square_on(square_on));
	
object_triangle triangle ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.triangle_on(triangle_on));
	
object_oval oval ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.oval_on(oval_on));
	
object_rectangle rectangle ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.rectangle_on(rectangle_on));
	
object_diamond diamond ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.diamond_on(diamond_on));
	
object_pentagon pentagon ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.pentagon_on(pentagon_on));
	
object_hexagon hexagon ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.hexagon_on(hexagon_on));
	
object_star star ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.star_on(star_on));
							  
//------------Parametros de los bordes-----------//

assign bordeA = ((212 <= HCount) && (HCount <= 214));
assign bordeB = ((426 <= HCount) && (HCount <= 428));
assign bordeC = ((158 <= VCount) && (VCount <= 161));
assign bordeD = ((319 <= VCount) && (VCount <= 322));

assign borde_on = (bordeA || bordeB || bordeC || bordeD);
							  
//------------Selector de los colores------------//
always @*
begin
	if( circle_on || square_on || triangle_on || oval_on || rectangle_on ||
		 diamond_on || pentagon_on || hexagon_on || star_on )
		rgb <= 3'b001;
	else begin
		if(borde_on)
			rgb <=3'b110;
		else
			rgb <= 3'b000;
	end
end

endmodule
