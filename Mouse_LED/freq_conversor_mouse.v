`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:38:21 05/06/2016 
// Design Name: 
// Module Name:    freq_conversor_mouse 
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
module freq_conversor_mouse(
    input Clk,
    output reg New_Clk
    );

//internal Var
reg[14:0] count;
reg [1:0] state, next_state;
//code
initial
begin
New_Clk = 1;
count = 0;
end
always@(Clk)
begin 
case(state)
   0:begin
	  New_Clk = 0;
	  count = count + 1;
	  if(count == 2)//
	  begin 
	     next_state = 1;
		  count = 0;
	  end
	  else 
	     next_state = 0;
	  end
	1:begin
	  New_Clk = 1;
	  count = count + 1; 
	  if(count == 2)//
	  begin
	     next_state = 0;
		  count = 0;
	  end
	  else 
	     next_state = 1; 
	  end
	 default:next_state = 0;
endcase
end 
always@(posedge Clk)
begin 
state <= next_state;
end

endmodule


