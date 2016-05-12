`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:43:59 05/12/2016 
// Design Name: 
// Module Name:    ExtendImm 
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
module ExtendImm(
    input [11:0] Immediate,
    output reg [31:0] ExtImm
    );

always @* begin
	ExtImm[31:12] <= 20'b0;
	ExtImm[11:0] <= Immediate;
end

endmodule
