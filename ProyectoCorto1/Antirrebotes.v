`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:20:08 03/17/2016 
// Design Name: 
// Module Name:    Antirrebotes 
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
module Antirrebotes(
    input boton0,
    input Clk,
	 input t300ms,
	 output reg actCuenta,
    output reg boton
    );

reg [1:0] state,next_state;

always@*
begin
case(state)
    0:begin
	    actCuenta = 0;
		 boton = 0;
	    if(boton0 == 1)
		    next_state = 1;
		 else 
		    next_state = 0;
		end
	 1:begin
	    actCuenta = 1;
		 boton = 1;
	    if(t300ms == 1)
		    next_state = 2;
		 else
		    next_state = 1;
		end
	 2:begin
	    actCuenta = 0;
		 boton = 1;
	    if(boton0 == 0)
          next_state = 0;
       else 
          next_state = 2;
      end
    default:next_state = 0;
endcase	 
end
always@(posedge Clk) state <= next_state;
endmodule
