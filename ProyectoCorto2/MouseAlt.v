`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:48:05 05/09/2016 
// Design Name: 
// Module Name:    MouseAlt 
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
module MouseAlt(
	 input clk,
	 input up0,
	 input down0,
	 input left0,
	 input right0,
	 input select0,
	 output Click,
	 output [9:0] posMX, posMY
    );

wire [7:0] MagX, MagY;
wire Izquierda, Derecha, Arriba, Abajo;

MouseMove move (
	.clk(clk),
	.up0(up0),
	.down0(down0),
	.left0(left0),
	.right0(right0),
	.select0(select0),
	.Click(Click),
	.Izquierda(Izquierda),
	.Derecha(Derecha),
	.Arriba(Arriba),
	.Abajo(Abajo),
	.MagX(MagX),
	.MagY(MagY)
	);

MousePos pos (
    .MagX(MagX), 
    .MagY(MagY), 
    .Arriba(Arriba), 
    .Abajo(Abajo), 
    .Izquierda(Izquierda), 
    .Derecha(Derecha), 
    .posMX(posMX), 
    .posMY(posMY)
    );
endmodule
