`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:34 05/02/2016 
// Design Name: 
// Module Name:    conversor_A_Mouse 
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
module conversor_A_Mouse(
    //input clk,
    input izquierda,
	 input derecha,
	 input arriba,
	 input abajo,
	 input select,
	 output reg Click,
	 output reg Izquierda,
	 output reg Derecha,
	 output reg Arriba,
	 output reg Abajo,
	 output reg [7:0] MagX,
	 output reg [7:0] MagY
    );
	 
initial 
begin
Click = 1'b0;
Izquierda = 1'b0;
Derecha = 1'b0;
Arriba = 1'b0;
Abajo = 1'b0;
MagX = 8'b00000000;
MagY = 8'b00000000;

end
always@*
begin
if(select)
   Click = 1;
if(select == 0)
   Click = 0;
if(izquierda)
   Izquierda = 1;
if(izquierda == 0)
   Izquierda = 0;
if(derecha)
   Derecha = 1;
if(derecha == 0)
   Derecha = 0;
if(arriba)
   Arriba = 1;
if(arriba == 0)
   Arriba = 0;
if(abajo)
   Abajo  = 1;
if(abajo == 0)
   Abajo  = 0;
MagX = ((Izquierda == 1)||(Derecha == 1))? 8'b00110010:8'b00000000;
MagY = ((Arriba == 1)||(Abajo == 1))? 8'b00110010:8'b00000000;
end
endmodule
