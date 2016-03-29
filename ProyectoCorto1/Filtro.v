`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:50 03/19/2016 
// Design Name: 
// Module Name:    Filtro 
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
module Filtro(
    input boton0,
    input Clk,
    output boton
    );
//variables internas
wire t300ms, enableCount;
//Code

    Antirrebotes anti (boton0,Clk,t300ms,enableCount,boton);
	 Temporizador temp (enableCount,Clk,t300ms);


endmodule
