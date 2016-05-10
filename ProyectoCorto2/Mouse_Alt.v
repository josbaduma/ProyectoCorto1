`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:36 05/09/2016 
// Design Name: 
// Module Name:    Mouse_Alt 
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
module MouseMove(
	 input clk,
	 input up0,
	 input down0,
	 input left0,
	 input right0,
	 input select0,
	 output Click,
	 output Izquierda,
	 output Derecha,
	 output Arriba,
	 output Abajo,
	 output [7:0] MagX,
	 output [7:0] MagY
    );
	 
// var
wire arriba, abajo, izquierda, derecha, select;

//code	
   Filtro f1(up0,clk,arriba);
	Filtro f2(down0,clk,abajo);
	Filtro f3(left0,clk,izquierda);
	Filtro f4(right0,clk,derecha); 
	Filtro f5(select0,clk,select);
	conversor_A_Mouse mouse_falso(izquierda,derecha,arriba,abajo,select,Click,Izquierda,Derecha,Arriba,Abajo,MagX,MagY);
	
endmodule
