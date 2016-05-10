`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:55:19 04/14/2016 
// Design Name: 
// Module Name:    controlMouse 
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
module controlMouse(
    input Clk,
    input M_CLK,
    inout M_Dat,
	 output Click,
	 output Izquierda,
	 output Derecha,
	 output Arriba,
	 output Abajo,
	 output [7:0] MagX,
	 output [7:0] MagY,
	 output [31:0] c
    );
//Internal variables
reg direccion;
reg [4:0] count;
reg [6:0] bitCount;
reg [31:0] data;//32
reg [31:0] inData; //32
reg [2:0] state,next_state; 
//Code
//output
assign Click = data[31] || data[30]; //click izquierdo y derecho iguales
assign Izquierda = (data[27] == 1)? 1'b1:1'b0;
assign Derecha = (data[27] == 0)? 1'b1:1'b0;
assign Abajo = (data[26] == 1)? 1'b1:1'b0;
assign Arriba = (data[26] == 0)? 1'b1:1'b0;
assign MagX = {data[13],data[14],data[15],data[16],data[17],data[18],data[19],data[20]};
assign MagY = {data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9]};
assign c = data;
//bidir
assign M_Dat = ((count == 0)&&direccion)? 1'b0:
	((count == 1)&&direccion)? 1'b0:
	((count == 2)&&direccion)? 1'b0:
	((count == 3)&&direccion)? 1'b1:
	((count == 4)&&direccion)? 1'b0:
	((count == 5)&&direccion)? 1'b1:
	((count == 6)&&direccion)? 1'b1: 
	((count == 7)&&direccion)? 1'b1: 
	((count == 8)&&direccion)? 1'b1: 
	((count == 9)&&direccion)? 1'b1:
	((count == 10)&&direccion)? 1'bZ:1'bZ;

	
initial
begin
direccion = 1;
count = 0;
end

always@(negedge M_CLK)
begin 
case(state)
   0:begin
	  data = 0;
	  inData = 0;
	   count = count + 1;
	   if(count >= 11)
		begin
	      next_state = 1;
		end
	   else
	      next_state = 0;
		end
		
	1:begin
	  direccion = 0;
	  if(M_Dat == 0)
	     next_state = 2;
	  else
	     next_state = 1;	     
	  end
	2:begin
	  if(M_Dat == 0)
	     next_state = 3;
	  else
	     next_state = 2;
	  end
	3:begin
	  bitCount = 0;
	  if(M_Dat == 0)
	  begin
	     data = M_Dat;
	     bitCount = bitCount + 1;
	     next_state = 4;
	  end
	  else
	     next_state = 3;
	  end
	4:begin
	  data = data << 1;
	  inData = M_Dat;
	  data = data | inData;
	  bitCount = bitCount + 1;
	  if(bitCount == 32)
	  begin
	     next_state = 3;
		  end
	  else
	     next_state = 4;
	  end
	 default:next_state = 0;
endcase
end

always@(negedge M_CLK)state <= next_state; 
 

endmodule
