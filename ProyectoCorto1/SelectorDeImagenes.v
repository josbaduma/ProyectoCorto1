`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:39 03/17/2016 
// Design Name: 
// Module Name:    SelectorDeImagenes 
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
module SelectorDeImagenes(
    input Izquierda,
    input Derecha,
    input Arriba,
    input Abajo,
    input Select,
	 input Clk,
	 output reg circulo,
	 output reg cuadrado,
	 output reg triangulo,
	 output reg ovalo,
	 output reg rectangulo,
	 output reg rombo,
	 output reg hexagono,
	 output reg pentagono,
	 output reg estrella,
	 output reg enter
    );

reg [4:0] state,next_state;

always@(state, Izquierda, Derecha, Arriba, Abajo, Select)
begin
case(state)
     0:begin
	    circulo = 1;
	    cuadrado = 0;
	    triangulo = 0;
	    ovalo = 0;
	    rectangulo = 0;
	    rombo = 0;
	    hexagono = 0;
	    pentagono = 0;
	    estrella = 0;
		 enter = 0;
	     if(Derecha == 1)
		     next_state = 1;
		  else if(Abajo == 1)
		     next_state = 3;
		  else if(Select == 1)
		     next_state = 9; 
		  else
		     next_state = 0;
		 end
	  1:begin
	    cuadrado = 1;
		 circulo = 0;
	    triangulo = 0;
	    ovalo = 0;
	    rectangulo = 0;
	    rombo = 0;
	    hexagono = 0;
	    pentagono = 0;
	    estrella = 0;
		 enter = 0;
	     if(Derecha == 1)
		     next_state = 2;
		  else if(Izquierda == 1)
		     next_state = 0;
		  else if(Abajo == 1)
		     next_state = 4;
		  else if(Select == 1)
		     next_state = 10;
		  else
		     next_state = 1;
		  end
		2:begin
	    triangulo = 1;
   	 circulo = 0;
 	    cuadrado = 0;
	    ovalo = 0;
	    rectangulo = 0;
	    rombo = 0;
	    hexagono = 0;
	    pentagono = 0;
	    estrella = 0;
		 enter = 0;
		   if(Izquierda == 1)
			   next_state = 1;
			else if(Abajo == 1)
			   next_state = 5;
			else if(Select == 1)
			   next_state = 11;
			else
			   next_state = 2;
			end
		3:begin
		 ovalo = 1;
		 circulo = 0;
	    cuadrado = 0;
	    triangulo = 0;
	    rectangulo = 0;
	    rombo = 0;
	    hexagono = 0;
	    pentagono = 0;
	    estrella = 0;
		 enter = 0;
		   if(Derecha == 1)
			   next_state = 4;
			else if(Arriba == 1)
			   next_state = 0;
			else if(Abajo == 1)
			   next_state = 6;
         else if(Select == 1)
            next_state = 12;
         else
            next_state = 3;
         end
       4:begin
		 rectangulo = 1;
		 circulo = 0;
	    cuadrado = 0;
	    triangulo = 0;
	    ovalo = 0;
	    rombo = 0;
	    hexagono = 0;
	    pentagono = 0;
	    estrella = 0;
		 enter = 0;
          if(Derecha == 1)
             next_state = 5;
          else if(Izquierda == 1)
             next_state = 3;
          else if(Arriba == 1)
             next_state = 	1;
          else if(Abajo == 1)
             next_state = 7;
          else if(Select == 1)
             next_state = 13;
          else
             next_state = 4;
          end
       5:begin
		 rombo = 1;
		 circulo = 0;
	    cuadrado = 0;
	    triangulo = 0;
	    ovalo = 0;
	    rectangulo = 0;
	    hexagono = 0;
	    pentagono = 0;
	    estrella = 0;
		 enter = 0;
          if(Izquierda == 1)
             next_state = 4;
          else if(Arriba == 1)
             next_state = 2;
          else if(Abajo == 1)
             next_state = 8;
          else if(Select == 1)
             next_state  = 14;
          else 
             next_state = 5;
          end
        6:begin
		  hexagono = 1;
		  circulo = 0;
	     cuadrado = 0;
	     triangulo = 0;
	     ovalo = 0;
	     rectangulo = 0;
	     rombo = 0;
	     pentagono = 0;
	     estrella = 0;
		  enter = 0;
          if(Derecha == 1)
             next_state = 7;
          else if(Arriba == 1)
             next_state = 3;
        	 else if(Select == 1)
			    next_state = 15;
			 else 
			    next_state = 6;
		    end
		  7:begin
		  pentagono = 1;
		  circulo = 0;
	     cuadrado = 0;
	     triangulo = 0;
	     ovalo = 0;
	     rectangulo = 0;
	     rombo = 0;
	     hexagono = 0;
	     estrella = 0;
		  enter = 0;
		    if(Derecha == 1)
			    next_state = 8;
			 else if(Izquierda == 1)
			    next_state = 6;
		    else if(Arriba == 1)
			    next_state = 4;
			 else if(Select == 1)
			    next_state = 16;
			 else 
			    next_state = 7;
			 end
			8:begin
			estrella = 1;
			circulo = 0;
	      cuadrado = 0;
	      triangulo = 0;
	      ovalo = 0;
	      rectangulo = 0;
	      rombo = 0;
	      hexagono = 0;
	      pentagono = 0;
			enter = 0;
			  if(Izquierda == 1)
              next_state = 7;
           else if(Arriba == 1)
              next_state = 5;
           else if(Select == 1)
              next_state = 17;
           else 
              next_state = 8;
           end
         9:begin
			circulo = 1;
	      cuadrado = 0;
	      triangulo = 0;
	      ovalo = 0;
	      rectangulo = 0;
	      rombo = 0;
	      hexagono = 0;
	      pentagono = 0;
	      estrella = 0;
		   enter = 1;
           if(Select == 1)
               next_state = 0;
			  else 
			      next_state = 9;
           end			  
         10:begin
			cuadrado = 1;
		   circulo = 0;
	      triangulo = 0;
	      ovalo = 0;
	      rectangulo = 0;
	      rombo = 0;
	      hexagono = 0;
	      pentagono = 0;
	      estrella = 0;
			enter = 1;
           if(Select == 1)
               next_state = 1;
			  else
			      next_state = 10;
           end	
			11:begin
			triangulo = 1;
   	   circulo = 0;
 	      cuadrado = 0;
	      ovalo = 0;
	      rectangulo = 0;
	      rombo = 0;
	      hexagono = 0;
	      pentagono = 0;
	      estrella = 0;
			enter = 1;
           if(Select == 1)
               next_state = 2;
			  else
               next_state = 11;			  
           end	
			12:begin
			ovalo = 1;
		   circulo = 0;
	      cuadrado = 0;
	      triangulo = 0;
	      rectangulo = 0;
	      rombo = 0;
	      hexagono = 0;
	      pentagono = 0;
	      estrella = 0;
			enter = 1;
           if(Select == 1)
               next_state = 3;
			  else
               next_state = 12;
           end
         13:begin
			rectangulo = 1;
		   circulo = 0;
	      cuadrado = 0;
	      triangulo = 0;
	      ovalo = 0;
	      rombo = 0;
	      hexagono = 0;
	      pentagono = 0;
	      estrella = 0;
			enter = 1;
           if(Select == 1)
               next_state = 4;
				else
               next_state = 13;
           end
         14:begin
			rombo = 1;
		   circulo = 0;
	      cuadrado = 0;
	      triangulo = 0;
	      ovalo = 0;
	      rectangulo = 0;
	      hexagono = 0;
	      pentagono = 0;
	      estrella = 0;
			enter = 1;
           if(Select == 1)
               next_state = 5;
				else
               next_state = 14;
           end
         15:begin
			hexagono = 1;
		   circulo = 0;
	      cuadrado = 0;
	      triangulo = 0;
	      ovalo = 0;
	      rectangulo = 0;
	      rombo = 0;
	      pentagono = 0;
	      estrella = 0;
			enter = 1;
           if(Select == 1)
               next_state = 6;
					else
               next_state = 15;
           end	
         16:begin
			pentagono = 1;
		   circulo = 0;
	      cuadrado = 0;
	      triangulo = 0;
	      ovalo = 0;
	      rectangulo = 0;
	      rombo = 0;
	      hexagono = 0;
	      estrella = 0;
			enter = 1;
           if(Select == 1)
               next_state = 7;
					else
               next_state = 16;
           end
         17:begin
			estrella = 1;
			circulo = 0;
	      cuadrado = 0;
	      triangulo = 0;
	      ovalo = 0;
	      rectangulo = 0;
	      rombo = 0;
	      hexagono = 0;
	      pentagono = 0;
			enter = 1;
           if(Select == 1)
               next_state = 8;
				else
               next_state = 17;
           end
         default:next_state = 0;
endcase
end
always@(posedge Clk)state <= next_state;		
endmodule
