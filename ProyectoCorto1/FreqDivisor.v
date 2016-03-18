`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:58:43 03/16/2016 
// Design Name: 
// Module Name:    FreqDivisor 
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
module FreqDivisor(
    input clk,
	 input rst,
    output PixelCLK
    );

reg [1:0] count;
reg [1:0] countNext;

//Contador para el divisor de frecuencia
always @(posedge clk or posedge rst)
begin
	count <= countNext;
	if(rst) count <= 0;
end

always @(count)
	countNext <= count + 1;

//Asigna el valor logico del clk de 25MHz
assign PixelCLK = (count[1:0] == 2'b11);

endmodule
