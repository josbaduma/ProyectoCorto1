`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:12 05/27/2016 
// Design Name: 
// Module Name:    MUX_REG 
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
module MUX_REG(
    input [3:0] DI0,
    input [3:0] DI1,
    input SelData,
    output reg [3:0] DO
    );
	 
always @* begin
	case(SelData)
		0: DO <= DI0;
		1: DO <= DI1;
	endcase
end

endmodule
