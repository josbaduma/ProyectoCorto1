`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:24:42 05/15/2016 
// Design Name: 
// Module Name:    AdderPC 
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
module AdderPC(
    input [31:0] DI1,
    input [31:0] DI2,
    output reg [31:0] DO
    );

always @* begin
	DO = DI1 + DI2;
end

endmodule
