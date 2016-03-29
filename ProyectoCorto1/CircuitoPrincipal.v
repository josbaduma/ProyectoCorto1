`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:05:05 03/20/2016 
// Design Name: 
// Module Name:    CircuitoPrincipal 
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
module CircuitoPrincipal(
    input Arriba0,
    input Abajo0,
    input Izquierda0,
    input Derecha0,
    input Select0,
    input Clk
    );
//Variables internas
wire Arriba,Abajo,Izquierda,Derecha,Centrocirculo,cuadrado,triangulo,ovalo,rectangulo,rombo,hexagono,pentagono,estrella,enter;
//Code
     Filtro f1(Arriba0,Clk,Arriba);
	  Filtro f2(Abajo0,Clk,Abajo);
	  Filtro f3(Izquierda0,Clk,Izquierda);
	  Filtro f4(Derecha0,Clk,Derecha);
	  Filtro f5(Select0,Clk,Select);
	  SelectorDeImagenes sel (Izquierda,Derecha,Arriba,Abajo,Select,Clk, circulo,cuadrado,triangulo,ovalo,rectangulo,
	  rombo,hexagono,pentagono,estrella,enter);

endmodule
