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
	 output [7:0] MagY
    );
//Internal variables
reg direccion;
reg maquina;
reg [3:0] count;
reg [6:0] bitCount;
reg [32:0] data;
reg [32:0] inData; 
reg [2:0] st,nst,state,next_state; 
//Code
//output
assign Click = data[31] || data[31]; //click izquierdo y derecho iguales
assign Izquierda = (data[27] == 1)? 1'b1:1'b0;
assign Derecha = (data[27] == 0)? 1'b1:1'b0;
assign Abajo = (data[26] == 1)? 1'b1:1'b0;
assign Arriba = (data[26] == 0)? 1'b1:1'b0;
assign MagX = {data[13],data[14],data[15],data[16],data[17],data[18],data[19],data[20]};
assign MagY = {data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9]};
//bidir
assign M_Dat = ((count == 1)&&direccion)? 1'b1:
   ((count == 1)&&direccion)? 1'b1:
	((count == 2)&&direccion)? 1'b1:
	((count == 3)&&direccion)? 1'b1:
	((count == 4)&&direccion)? 1'b0:
	((count == 5)&&direccion)? 1'b1:
	((count == 6)&&direccion)? 1'b0:
	((count == 7)&&direccion)? 1'b0:1'bZ;
	
//input

always@(Clk,count)
begin
case(st)
   0:begin
	  maquina = 0;
	  direccion = 1;
	  count = 0;  
	  nst = 1;
	  end
    1:begin
	   count = count + 1;
	   if(count == 8)
	      nst = 2;
	   else
	      nst = 1;
		end
	2:begin
	  maquina = 1;
	  nst = 2;
	  end
	default:nst = 0;
endcase
end

always@(negedge Clk)st <= nst;

always@(negedge maquina, negedge M_CLK)
begin 
case(state)
	0:begin
	  data = 0;
	  inData = 0;
	  //if(maquina == 1 && M_Dat == 0)
	 // begin
	 bitCount = 0;
	 next_state = 1; 
	  //end
	  //else
	    // next_state = 0;
	  end
	1:begin
	  //data = 0;
	  //inData = 0;
	  bitCount = 0;
	  if(maquina == 1 && M_Dat == 0)
	  begin
	     data = M_Dat;
	     bitCount = bitCount + 1;
	     next_state = 2;
	  end
	  else
	     next_state = 1;
	  end
	2:begin
	  data = data << 1;
	  inData = M_Dat;
	  data = data | inData;
	  bitCount = bitCount + 1;
	  if(bitCount == 32)
	     next_state = 1;
	  else
	     next_state = 2;
	  end
	 default:next_state = 0;
endcase
end

always@(negedge M_CLK)state <= next_state; 
 

endmodule
