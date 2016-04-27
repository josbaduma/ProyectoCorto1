`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:51:21 04/26/2016 
// Design Name: 
// Module Name:    moduleForTest 
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
module moduleForTest(
	 input Click,
	 input Izquierda,
	 input Derecha,
	 input Arriba,
	 input Abajo,
	 input [7:0] MagX,
	 input [7:0] MagY,
	 input clk,
	 output led0,//Izquierda
	 output led1,//Derecha
	 output led2,//Arriba
	 output led3,//Abajo
	 output led4,//magVertical diferente 0 
	 output led5//maghorizontal diferente 0 
    );
	 
reg [7:0] X,Y;

assign led0 = Izquierda;
assign led1 = Derecha;
assign led2 = Arriba;
assign led3 = Abajo;
assign led4 = (Y > 0)? 1'b1:1'b0;
assign led5 = (X > 0)? 1'b1:1'b0;

initial@(posedge clk)
begin 
X = 0; 
Y = 0;
end 

always@(posedge clk)
begin 
X = MagX;
Y = MagY;
end 
endmodule
