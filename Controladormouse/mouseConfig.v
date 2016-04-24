`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:59:27 04/14/2016 
// Design Name: 
// Module Name:    mouseConfig 
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
module mouseConfig(
    input Enable,
    input Clk,
    output Config
    );
//Internal varriables
reg[3:0] cont = 0;
reg state,next_state
//Code
always@(posedge Clk, Enable)
begin
case(state)
    
end
endmodule
