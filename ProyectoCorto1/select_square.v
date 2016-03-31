`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:26 03/29/2016 
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
localparam posx = 208;
localparam posy = 154;
//Code
always@ *
begin 
if(enter == 1)
  regH = 800;
  regV = 0;
else if(cuadrado == 1)
  regH = posx;
  regV = 0;
else if(triangulo == 1)
  regH = posx + posx;
  regV = 0;
else if(ovalo == 1)
  regH = 0;
  regV = posy;
else if(rectangulo == 1)
  regH = posx;
  regV = posy;
else if(rombo == 1)
  regH = posx + posx;
  regV = posy;
else if(hexagono == 1)
  regH = 0;
  regV = posy + posy;
else if(pentagono == 1)
  regH = posx;
  regV = posy + posy;
else //estrella
  regH = posx + posx;
  regV = posy + posy;
end

//Bordes del selector
assign bordeSelecA = ((4 + regH <= HCount) && (HCount <= 211 + regH ) && (3 + regV <= VCount) && (VCount <= 4 + regV ));
assign bordeSelecB = ((4 + regH <= HCount) && (HCount <= 211 + regH ) && (156 + regV <= VCount) && (VCount <= 157 + regV ));
assign bordeSelecC = ((4 + regH <= HCount) && (HCount <= 5 + regH ) && (3 + regV <= VCount) && (VCount <= 157 + regV ));
assign bordeSelecD = ((210 + regH <= HCount) && (HCount <= 211 + regH ) && (3 + regV <= VCount) && (VCount <= 157 + regV ));

assign bordeSelec_on = (bordeSelecA || bordeSelecB || bordeSelecC || bordeSelecD);


endmodule
