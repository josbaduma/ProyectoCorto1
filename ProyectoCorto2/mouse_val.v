`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:13:23 05/08/2016 
// Design Name: 
// Module Name:    mouse_val 
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
module mouse_val(
	 input Click,
	 input [9:0] Mouse_x,//ojo bits aqui y en variables
	 input [9:0] Mouse_y,//ojo bits
    input [4:0] card1,//posiciones de  cartas
	 input [4:0] card2,
	 input [4:0] card3,
	 input [4:0] card4,
	 input [4:0] card5,
	 input [4:0] card6,
	 input [4:0] card7,
	 input [4:0] card8,
	 input [4:0] card9,
	 input [4:0] card10,
	 input [4:0] card11,
	 input [4:0] card12,
	 input [4:0] card13,
	 input [4:0] card14,
	 input [4:0] card15,
	 input [4:0] card16,
	 output reg [4:0] card//carta seleccionada[1,16], 0 es ninguna queda apuntando a la ultima seleccion
    );
//internal var 
reg[9:0] posX [0:17];//cordenadas x para una posicion
reg[9:0] posY [0:17];//cordenadas y para una posicion
reg[3:0] m_size;////falta
reg[6:0] c_size_x;//tamano carta 
reg[6:0] c_size_y;//tamano carta
reg[9:0] cordx;//posicion de toque
reg[9:0] cordy;//posicion de toque
reg[4:0] elect_pos;//posicion elegida [1,16], 0 es ninguna 
initial
begin 
m_size = 8;
c_size_x = 90;
c_size_y = 90;

posY[1] = 60;
posY[2] = 60;
posY[3] = 60;
posY[4] = 60;
posY[5] = 160;
posY[6] = 160;
posY[7] = 160;
posY[8] = 160;
posY[9] = 260;
posY[10] = 260;
posY[11] = 260;
posY[12] = 260;
posY[13] = 360;
posY[14] = 360;
posY[15] = 360;
posY[16] = 360;
posX[1] = 121;
posX[2] = 221;
posX[3] = 321;
posX[4] = 421;
posX[5] = 121;
posX[6] = 221;
posX[7] = 321;
posX[8] = 421;
posX[9] = 121;
posX[10] = 221;
posX[11] = 321;
posX[12] = 421;
posX[13] = 121; 
posX[14] = 221;
posX[15] = 321;
posX[16] = 421;
end  
always@*
begin
cordx = Mouse_x + m_size/2;
cordy = Mouse_y + m_size/2;
if((cordx >= posX[1])&&(cordx <= (posX[1]+ c_size_x))&&(cordy >= posY[1])&&(cordy <= (posY[1]+ c_size_y))&&Click)
   elect_pos = 1;
else if((cordx >= posX[2])&&(cordx <= (posX[2]+ c_size_x))&&(cordy >= posY[2])&&(cordy <= (posY[2]+ c_size_y))&&Click)
   elect_pos = 2;
else if((cordx >= posX[3])&&(cordx <= (posX[3]+ c_size_x))&&(cordy >= posY[3])&&(cordy <= (posY[3]+ c_size_y))&&Click)
   elect_pos = 3;
else if((cordx >= posX[4])&&(cordx <= (posX[4]+ c_size_x))&&(cordy >= posY[4])&&(cordy <= (posY[4]+ c_size_y))&&Click)
   elect_pos = 4;
else if((cordx >= posX[5])&&(cordx <= (posX[5]+ c_size_x))&&(cordy >= posY[5])&&(cordy <= (posY[5]+ c_size_y))&&Click)
   elect_pos = 5;
else if((cordx >= posX[5])&&(cordx <= (posX[5]+ c_size_x))&&(cordy >= posY[5])&&(cordy <= (posY[5]+ c_size_y))&&Click)
   elect_pos = 5;
else if((cordx >= posX[6])&&(cordx <= (posX[6]+ c_size_x))&&(cordy >= posY[6])&&(cordy <= (posY[6]+ c_size_y))&&Click)
   elect_pos = 6;
else if((cordx >= posX[7])&&(cordx <= (posX[7]+ c_size_x))&&(cordy >= posY[7])&&(cordy <= (posY[7]+ c_size_y))&&Click)
   elect_pos = 7;
else if((cordx >= posX[8])&&(cordx <= (posX[8]+ c_size_x))&&(cordy >= posY[8])&&(cordy <= (posY[8]+ c_size_y))&&Click)
   elect_pos = 8;
else if((cordx >= posX[9])&&(cordx <= (posX[9]+ c_size_x))&&(cordy >= posY[9])&&(cordy <= (posY[9]+ c_size_y))&&Click)
   elect_pos = 9;
else if((cordx >= posX[10])&&(cordx <= (posX[10]+ c_size_x))&&(cordy >= posY[10])&&(cordy <= (posY[10]+ c_size_y))&&Click)
   elect_pos = 10;
else if((cordx >= posX[11])&&(cordx <= (posX[11]+ c_size_x))&&(cordy >= posY[11])&&(cordy <= (posY[11]+ c_size_y))&&Click)
   elect_pos = 11;
else if((cordx >= posX[12])&&(cordx <= (posX[12]+ c_size_x))&&(cordy >= posY[12])&&(cordy <= (posY[12]+ c_size_y))&&Click)
   elect_pos = 12;
else if((cordx >= posX[13])&&(cordx <= (posX[13]+ c_size_x))&&(cordy >= posY[13])&&(cordy <= (posY[13]+ c_size_y))&&Click)
   elect_pos = 13;
else if((cordx >= posX[14])&&(cordx <= (posX[14]+ c_size_x))&&(cordy >= posY[14])&&(cordy <= (posY[14]+ c_size_y))&&Click)
   elect_pos = 14;
else if((cordx >= posX[15])&&(cordx <= (posX[15]+ c_size_x))&&(cordy >= posY[15])&&(cordy <= (posY[15]+ c_size_y))&&Click)
   elect_pos = 15;
else if((cordx >= posX[16])&&(cordx <= (posX[16]+ c_size_x))&&(cordy >= posY[16])&&(cordy <= (posY[16]+ c_size_y))&&Click)
   elect_pos = 16;
else
   elect_pos = 0;
end

always@(elect_pos)//ojo
begin
if(elect_pos == card1)
   card = 1;
else if(elect_pos == card2)
   card = 2;
else if(elect_pos == card3)
   card = 3;
else if(elect_pos == card4)
   card = 4;
else if(elect_pos == card5)
   card = 5;
else if(elect_pos == card6)
   card = 6;
else if(elect_pos == card7)
   card = 7;
else if(elect_pos == card8)
   card = 8;
else if(elect_pos == card9)
   card = 9;
else if(elect_pos == card10)
   card = 10;
else if(elect_pos == card11)
   card = 11;
else if(elect_pos == card12)
   card = 12;
else if(elect_pos == card13)
   card = 13;
else if(elect_pos == card14)
   card = 14;
else if(elect_pos == card15)
   card = 15;
else if(elect_pos == card16)
   card = 16;
else 
   card = 0;
end
endmodule

