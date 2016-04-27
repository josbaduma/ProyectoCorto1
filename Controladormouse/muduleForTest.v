`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:13:49 04/26/2016 
// Design Name: 
// Module Name:    muduleForTest 
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
module muduleForTestMain(
    input M_Clk,
    inout M_Dat,
	 input Clk,
	 output wire led0,//Izquierda
	 output wire led1,//Derecha
	 output wire led2,//Arriba
	 output wire led3,//Abajo
	 output wire led4,//magVertical diferente 0 
	 output wire led5//maghorizontal diferente 0 
    );
//internal var
wire New_Clk, Click, Izquierda, Derecha, Arriba, Abajo; 
wire [7:0] MagX, MagY;
//code

Freq_Covesor_Mouse freq(Clk, New_Clk);
controlMouse control(New_Clk, M_Clk, M_Dat, Click, Izquierda, Derecha, Arriba, Abajo, MagX, MagY);
moduleForTest mftest(Click, Izquierda, Derecha, Arriba, Abajo, MagX, MagY, New_Clk, led0, led1, led2, led3, led4, led5);

endmodule
