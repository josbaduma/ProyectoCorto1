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
    input CLK,
	 input RST,
    output PixelCLK
    );

reg [1:0] count;
reg [1:0] countNext;

//Contador para el divisor de frecuencia
always @(posedge CLK or negedge RST)
begin
	if(RST) count = 0;
	else count <= countNext;
end

always @(count)
	countNext <= count + 1;

//Asigna el valor logico del CLK de 25MHz
assign PixelCLK = (count[1:0] == 2'b11);

endmodule
