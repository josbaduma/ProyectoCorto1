`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:35:55 05/09/2016 
// Design Name: 
// Module Name:    MousePos 
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
module MousePos(
    input [7:0] MagX,
    input [7:0] MagY,
    input Arriba,
    input Abajo,
    input Izquierda,
    input Derecha,
    output reg [9:0] posMX,
    output reg [9:0] posMY
    );

initial begin
	posMX = 10'b0000000000;
	posMY = 10'b0000000000;
end

always @* begin
	if(Izquierda & (posMX >= 0))
		posMX = posMX - MagX;
	else if(Derecha & (posMX < 640))
		posMX = posMX + MagX;
	if(Arriba & (posMY >= 0))
		posMY = posMY - MagY;
	else if(Abajo & (posMY < 480))
		posMY = posMY + MagY;
end

endmodule
