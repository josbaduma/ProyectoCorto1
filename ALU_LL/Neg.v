`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:39 05/14/2016 
// Design Name: 
// Module Name:    Neg 
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
module Neg(
    input[31:0] A0,
    output[31:0]A
    );
	 
assign A = (~ A0) + 1;

endmodule
