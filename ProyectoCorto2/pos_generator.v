`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:12:24 05/09/2016 
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
    input clk,
    output reg [4:0] card1,
	 output reg [4:0] card2,
	 output reg [4:0] card3,
	 output reg [4:0] card4,
	 output reg [4:0] card5,
	 output reg [4:0] card6,
	 output reg [4:0] card7,
	 output reg [4:0] card8,
	 output reg [4:0] card9,
	 output reg [4:0] card10,
	 output reg [4:0] card11,
	 output reg [4:0] card12,
	 output reg [4:0] card13,
	 output reg [4:0] card14,
	 output reg [4:0] card15,
	 output reg [4:0] card16
    );

//internal var
reg [4:0] state, next_state;
reg [3:0] count, next_value, i, st, nst;
reg [4:0] posicion [0:17];//[3:0] [0:17]
reg avanzar0, avanzar, aceptado;
//code

 
always@(clk)
begin
card1 <=  posicion[0];
card2 <= posicion[1];
card3 <= posicion[2];
card4 <= posicion[3];
card5 <= posicion[4];
card6 <= posicion[5];
card7 <= posicion[6];
card8 <= posicion[7];
card9 <= posicion[8];
card10 <= posicion[9];
card11 <= posicion[10];
card12 <= posicion[11];
card13 <= posicion[12];
card14 <= posicion[13];
card15 <= posicion[14];
card16 <= posicion[15];
end

always@(posedge clk)
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
	  aceptado = 1;
	  next_value = $random;
	  next_state = 2;
	  end
	 2:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 3;
		else
		begin
		   aceptado = 0;
		   next_state = 18;
		end
	   end
	 3:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 4;
		else
		begin		
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	 4:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 5;
		else
      begin		
		   next_state = 18;
		   aceptado = 0;
	   end 
	   end
	 5:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 6;
		else
      begin		
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	 6:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 7;
		else 
		begin
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	 7:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 8;
		else
      begin		
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	8:begin
	 if(posicion[state - 2] != next_value)
		   next_state = 9;
		else
      begin		
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	 9:begin
	   if(posicion[state - 2] != next_value)///////////////////cambiar st
		   next_state = 10;
		else
      begin		
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	 10:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 11;
		else 
		begin
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	 11:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 12;
		else
      begin	
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	 12:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 13;
		else
      begin
			next_state = 18;
		   aceptado = 0;
	   end
		end
	 13:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 14;
		else
      begin		
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	 14:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 15;
		else 
	   begin	
    		next_state = 18;
		   aceptado = 0;
		end
	   end
	 15:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 16;
		else
		begin		
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	 16:begin
	   if(posicion[state - 2] != next_value)
		   next_state = 17;
		else
		begin	
		   next_state = 18;
		   aceptado = 0;
		end
	   end
	 17:begin
		 if(posicion[state - 2] != next_value)
		   next_state = 18;
		 else
		 begin
		   next_state = 18;
		   aceptado = 0;
		 end
	   end
	 18:begin
	   //aceptado = 1;///tempo
	   if((count == 15) && aceptado)
		begin
		  posicion[count] = next_value + 1;
		  count = count + 1;
	     next_state = 19;
		end
	   else if(aceptado)
	   begin
	     posicion[count] = next_value + 1;
		  count = count + 1;
	     next_state = 1;
	   end
		else
	   begin
	     next_state = 1;
	   end
		end
	 19:begin
	   next_state = 4;
		end
	 default:next_state = 0;
endcase  
end

always@(posedge clk)
begin
state <= next_state;
end
/**
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
**/
endmodule 


