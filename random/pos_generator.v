`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:52:17 04/26/2016 
// Design Name: 
// Module Name:    pos_generator 
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
module pos_generator(
    input FPGA_Clk,
    output reg [9:0] card1X,
	 output reg [9:0] card1Y,
	 output reg [9:0] card2X,
	 output reg [9:0] card2Y,
	 output reg [9:0] card3X,
	 output reg [9:0] card3Y,
	 output reg [9:0] card4X,
	 output reg [9:0] card4Y,
	 output reg [9:0] card5X,
	 output reg [9:0] card5Y,
	 output reg [9:0] card6X,
	 output reg [9:0] card6Y,
	 output reg [9:0] card7X,
	 output reg [9:0] card7Y,
	 output reg [9:0] card8X,
	 output reg [9:0] card8Y,
	 output reg [9:0] card9X,
	 output reg [9:0] card9Y,
	 output reg [9:0] card10X,
	 output reg [9:0] card10Y,
	 output reg [9:0] card11X,
	 output reg [9:0] card11Y,
	 output reg [9:0] card12X,
	 output reg [9:0] card12Y,
	 output reg [9:0] card13X,
	 output reg [9:0] card13Y,
	 output reg [9:0] card14X,
	 output reg [9:0] card14Y,
	 output reg [9:0] card15X,
	 output reg [9:0] card15Y,
	 output reg [9:0] card16X,
	 output reg [9:0] card16Y,
	 output [3:0] c,
	 output d,
	 output e
	 	 
    );

//internal var
reg [1:0] state, next_state;
reg [3:0] count, next_value, i, st, nst;
reg [9:0] posicion [0:17];//[3:0] [0:17]
reg avanzar, aceptado;
//code
assign c = next_value;
assign d = aceptado;
assign e = avanzar;   
always@(FPGA_Clk)
begin
card1X <=  posicion[0];
card1Y <= posicion[1];
card2X <= posicion[2];
card2Y <= posicion[3];
card3X <= posicion[4];
card3Y <= posicion[5];
card4X <= posicion[6];
card4Y <= posicion[7];
card5X <= posicion[8];
card5Y <= posicion[9];
card6X <= posicion[10];
card6Y <= posicion[11];
card7X <= posicion[12];
card7Y <= posicion[13];
card8X <= posicion[14];
card8Y <= posicion[15];
end

always@(posedge FPGA_Clk)
begin
case(state)
    0:begin
	   count = 0;
		aceptado = 1;
	   posicion[0] = 0;
		posicion[1] = 0;
		posicion[2] = 0;
		posicion[3] = 0;
		posicion[4] = 0; 
		posicion[5] = 0;
		posicion[6] = 0;
		posicion[7] = 0;
		posicion[8] = 0;
		posicion[9] = 0;
		posicion[10] = 0;
		posicion[11] = 0;
		posicion[12] = 0;
		posicion[13] = 0;
		posicion[14] = 0;
		posicion[15] = 0;
		next_state = 1;
		next_value = 0;
	   end
	 1:begin
	  next_value = $random;
	  avanzar = 1;
	  next_state = 2;
	  end
	 2:begin
	  if(avanzar == 0)
	     next_state = 3;
	  else
	     next_state = 2;
	  end
	 3:begin
	   //aceptado = 1;///tempo
	   if((count == 15) && aceptado)
		begin
		  posicion[count] = next_value;
		  count = count + 1;
	     next_state = 4;
		end
	   else if(aceptado)
	   begin
	     posicion[count] = next_value;
		  count = count + 1;
	     next_state = 1;
	   end
		else
	   begin
	     aceptado = 1;
	     next_state = 1;
	   end
		end
	 4:begin
	   next_state = 4;
		end
	 default:next_state = 0;
endcase  
end

always@(posedge FPGA_Clk)
begin
state <= next_state;
end

always@(posedge FPGA_Clk)
begin
case(st)
    0:begin
	   if(avanzar && (posicion[st] != next_value))
		   nst = 1;
		else if(avanzar && (posicion[st] == next_value))
		begin
		   avanzar = 0;
		   nst = 0;
		   aceptado = 0;
		end
		else
		   nst = 0;
	   end
	 1:begin
	   if(posicion[st] != next_value)
		   nst = 2;
		else
		begin
         avanzar = 0;		
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 2:begin
	   if(posicion[st] != next_value)
		   nst = 3;
		else
      begin
         avanzar = 0;		
		   nst = 0;
		   aceptado = 0;
	   end 
	   end
	 3:begin
	   if(posicion[st] != next_value)
		   nst = 4;
		else
      begin
         avanzar = 0;		
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 4:begin
	   if(posicion[st] != next_value)
		   nst = 5;
		else 
		begin
		   avanzar = 0;
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 5:begin
	   if(posicion[st] != next_value)
		   nst = 6;
		else
      begin
         avanzar = 0;		
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 6:begin
	 if(posicion[st] != next_value)
		   nst = 7;
		else
      begin
         avanzar = 0;		
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 7:begin
	   if(posicion[st] != next_value)
		   nst = 8;
		else
      begin
         avanzar = 0;		
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 8:begin
	   if(posicion[st] != next_value)
		   nst = 9;
		else 
		begin
		   avanzar = 0;
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 9:begin
	   if(posicion[st] != next_value)
		   nst = 10;
		else
      begin
         avanzar = 0;		
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 10:begin
	   if(posicion[st] != next_value)
		   nst = 11;
		else
      begin		
		   avanzar = 0;
			nst = 0;
		   aceptado = 0;
	   end
		end
	 11:begin
	   if(posicion[st] != next_value)
		   nst = 12;
		else
      begin
         avanzar = 0;		
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 12:begin
	   if(posicion[st] != next_value)
		   nst = 13;
		else 
	   begin	
		   avanzar = 0;
    		nst = 0;
		   aceptado = 0;
		end
	   end
	 13:begin
	   if(posicion[st] != next_value)
		   nst = 14;
		else
		begin
         avanzar = 0;		
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 14:begin
	   if(posicion[st] != next_value)
		   nst = 15;
		else
		begin 
         avanzar = 0;		
		   nst = 0;
		   aceptado = 0;
		end
	   end
	 15:begin///cambiar avanzar
	    avanzar = 0;
		 if(posicion[st] != next_value)
		   nst = 0;
		 else
		 begin
		   nst = 0;
		   aceptado = 0;
		 end
	   end
	 default:nst = 0;
endcase
end

always@(posedge FPGA_Clk)
begin
st <= nst;
end

endmodule 
