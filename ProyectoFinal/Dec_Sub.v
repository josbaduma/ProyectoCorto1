`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:07 05/14/2016 
// Design Name: 
// Module Name:    Dec_Sub 
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
module Dec_Sub(
    input ALUControl_0,
    input[31:0] A,
    input[31:0] B,
    output[31:0] C
    );
assign C = (ALUControl_0)? B:A;

endmodule
