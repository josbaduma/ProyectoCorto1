`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:40:45 04/26/2016 
// Design Name: 
// Module Name:    Freq_Covesor_Mouse 
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
module Freq_Covesor_Mouse(
    input Clk,
    output reg New_Clk
    );

//internal Var
reg[14:0] count;
reg [1:0] state, next_state;
//code
always@(Clk)
begin 
case(state)
   0:begin
	  New_Clk = 0;
	  count = 0;
	  next_state = 1;
	  end
   1:begin
	  New_Clk = 0;
	  count = count + 1;
	  if(count == 4000)
	  begin 
	     next_state = 2;
		  count = 0;
	  end
	  else 
	     next_state = 1;
	  end
	2:begin
	  New_Clk = 1;
	  count = count + 1; 
	  if(count == 4000)
	  begin
	     next_state = 1;
		  count = 0;
	  end
	  else 
	     next_state = 2; 
	  end
	 default:next_state = 0;
endcase
end 
always@(posedge Clk)
begin 
state <= next_state;
end

endmodule
