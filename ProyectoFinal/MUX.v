`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:35 05/12/2016 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
    input [31:0] DI1,
    input [31:0] DI2,
    input SelData,
    output reg [31:0] DO
    );

always @* begin
	case(SelData)
		0: DO <= DI1;
		1: DO <= DI2;
	endcase
end

endmodule
