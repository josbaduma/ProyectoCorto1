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
	 input circle_select,
	 input square_select,
	 input triangle_select,
	 input oval_select,
	 input rectangle_select,
	 input diamond_select,
	 input hexagon_select,
	 input pentagon_select,
	 input star_select,
	 input full_screen,
    output reg [2:0] rgb
    );

wire circle_on, square_on, triangle_on, oval_on, rectangle_on;
wire diamond_on, pentagon_on, hexagon_on, star_on, text_top_on, text_bottom_on;

//------Modulos para cada objeto que se dibuja -------//
object_circle circle ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.circle_select(circle_select),
	.full_screen(full_screen),
	.circle_on(circle_on));
	
object_square square ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.square_select(square_select),
	.full_screen(full_screen),
	.square_on(square_on));
	
object_triangle triangle ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.triangle_select(triangle_select),
	.full_screen(full_screen),
	.triangle_on(triangle_on));
	
object_oval oval ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.oval_select(oval_select),
	.full_screen(full_screen),
	.oval_on(oval_on));
	
object_rectangle rectangle ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.rectangle_select(rectangle_select),
	.full_screen(full_screen),
	.rectangle_on(rectangle_on));
	
object_diamond diamond ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.diamond_select(diamond_select),
	.full_screen(full_screen),
	.diamond_on(diamond_on));
	
object_pentagon pentagon ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.pentagon_select(pentagon_select),
	.full_screen(full_screen),
	.pentagon_on(pentagon_on));
	
object_hexagon hexagon ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.hexagon_select(hexagon_select),
	.full_screen(full_screen),
	.hexagon_on(hexagon_on));
	
object_star star ( 
	.HCount(HCount), 
	.VCount(VCount), 
	.star_select(star_select),
	.full_screen(full_screen),
	.star_on(star_on));

	
select_square select (
   .HCount(HCount), 
	.VCount(VCount),
	.circulo(circle_select),
	.cuadrado(square_select),
	.triangulo(triangle_select),
	.ovalo(oval_select),
	.rectangulo(rectangle_select),
   .rombo(diamond_select),
	.hexagono(hexagon_select),
	.pentagono(pentagon_select),
	.estrella(star_select),
	.enter(full_screen),
	.bordeSelec_on(bordeSelec_on ));


object_text txt (
	.HCount(HCount),
	.VCount(VCount),
	.text_top_on(text_top_on));
	
	
object_text_bottom txt_btn (
	.HCount(HCount),
	.VCount(VCount),
	.circle_select(circle_select),
	.square_select(square_select),
	.triangle_select(triangle_select),
	.oval_select(oval_select),
	.rectangle_select(rectangle_select),
   .diamond_select(diamond_select),
	.hexagon_select(hexagon_select),
	.pentagon_select(pentagon_select),
	.star_select(star_select),
	.text_bottom_on(text_bottom_on));
	

object_text_figure txt_fig (
	.HCount(HCount),
	.VCount(VCount),
	.circle_select(circle_select),
	.square_select(square_select),
	.triangle_select(triangle_select),
	.oval_select(oval_select),
	.rectangle_select(rectangle_select),
   .diamond_select(diamond_select),
	.hexagon_select(hexagon_select),
	.pentagon_select(pentagon_select),
	.star_select(star_select),
	.text_figure_on(text_figure_on));
							  
//------------Parametros de los bordes-----------//

assign bordeA = ((212 <= HCount) && (HCount <= 214) && (26 <= VCount) && (VCount <= 463));
assign bordeB = ((426 <= HCount) && (HCount <= 428) && (26 <= VCount) && (VCount <= 463));
assign bordeC = ((25 <= VCount) && (VCount <= 26));
assign bordeD = ((171 <= VCount) && (VCount <= 172));
assign bordeE = ((316 <= VCount) && (VCount <= 317));
assign bordeF = ((462 <= VCount) && (VCount <= 463));

assign borde_on = (bordeA || bordeB || bordeC || bordeD || bordeE || bordeF);
							  
//------------Selector de los colores------------//
always @*
begin
	if( circle_on || square_on || triangle_on || oval_on || rectangle_on ||
		 diamond_on || pentagon_on || hexagon_on || star_on )
		rgb <= 3'b001;
	else if(bordeSelec_on)
	   rgb <= 3'b100;
	else if( ( borde_on && ~full_screen ) || text_top_on || (text_bottom_on && ~full_screen ))
		rgb <=3'b110;
	else if( text_figure_on && full_screen )
		rgb <= 3'b011;
	else
		rgb <= 3'b000;
end

endmodule
