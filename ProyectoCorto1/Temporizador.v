`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:20 03/18/2016 
// Design Name: 
// Module Name:    Temporizador 
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
module Temporizador(
    input Clk,
    input AbilitarCuenta,
    output reg FinalCuenta
    );
	 
reg [31:0] cont;

always@(posedge Clk)
begin
   if(AbilitarCuenta == 1)
      cont = cont + 1;
	else
	   cont = 0;/////recordar poner en cero
end
always@(cont)
begin
   if(cont >= 30000000)
      FinalCuenta<=1;
	else
	   FinalCuenta<=0;
end
endmodule
