`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:49 03/30/2016 
// Design Name: 
// Module Name:    select_square 
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
module select_square(
    input [9:0] HCount,
    input [9:0] VCount,
    input circulo,
	 input cuadrado,
	 input triangulo,
	 input ovalo,
	 input rectangulo,
	 input rombo,
	 input hexagono,
	 input pentagono,
	 input estrella,
	 input enter,
	 output bordeSelec_on 	
	 );
//internal var
reg [11:0] regV,regH;
//param
localparam posx = 214;
localparam posy = 146;
//Code
always@ *
begin 
if(enter == 1)
begin
  regH = 800;
  regV = 0;
end
else if(circulo == 1)
begin
  regH = 0;
  regV = 0;
end
else if(cuadrado == 1)
begin
  regH = posx;
  regV = 0;
end
else if(triangulo == 1)
begin
  regH = posx + posx;
  regV = 0;
end
else if(ovalo == 1)
begin
  regH = 0;
  regV = posy;
end
else if(rectangulo == 1)
begin
  regH = posx;
  regV = posy;
end
else if(rombo == 1)
begin
  regH = posx + posx;
  regV = posy;
end
else if(hexagono == 1)
begin
  regH = 0;
  regV = posy + posy;
end
else if(pentagono == 1)
begin
  regH = posx;
  regV = posy + posy;
end
else //estrella
begin  
  regH = posx + posx;
  regV = posy + posy;
end
end

//Bordes del selector
assign bordeSelecA = ((4 + regH <= HCount) && (HCount <= 209 + regH ) && (28 + regV <= VCount) && (VCount <= 29 + regV ));
assign bordeSelecB = ((4 + regH <= HCount) && (HCount <= 209 + regH ) && (167 + regV <= VCount) && (VCount <= 168 + regV ));
assign bordeSelecC = ((4 + regH <= HCount) && (HCount <= 5 + regH ) && (28 + regV <= VCount) && (VCount <= 168 + regV ));
assign bordeSelecD = ((208 + regH <= HCount) && (HCount <= 209 + regH ) && (28 + regV <= VCount) && (VCount <= 168 + regV ));

assign bordeSelec_on = (bordeSelecA || bordeSelecB || bordeSelecC || bordeSelecD);

endmodule
