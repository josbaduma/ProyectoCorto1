`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:48:19 04/26/2016
// Design Name:   moduleForTest
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Controladormouse/moduleForTest_test.v
// Project Name:  Controladormouse
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: moduleForTest
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module moduleForTest_test;

	// Inputs
	reg Click;
	reg Izquierda;
	reg Derecha;
	reg Arriba;
	reg Abajo;
	reg [7:0] MagX;
	reg [7:0] MagY;
	reg clk;

	// Outputs
	wire led0;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	wire led5;

	// Instantiate the Unit Under Test (UUT)
	moduleForTest uut (
		.Click(Click), 
		.Izquierda(Izquierda), 
		.Derecha(Derecha), 
		.Arriba(Arriba), 
		.Abajo(Abajo), 
		.MagX(MagX), 
		.MagY(MagY), 
		.clk(clk), 
		.led0(led0), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5)
	);

	initial begin
		// Initialize Inputs
		Click = 0;
		Izquierda = 0;
		Derecha = 1;
		Arriba = 1;
		Abajo = 0;
		MagX = 0;
		MagY = 0;
		clk = 0;

		// Wait 10 ns for global reset to finish
		#10;
        
		// Add stimulus here
		Izquierda = 1;
		Derecha = 0;
		Arriba = 0;
		Abajo = 1;
      #10;  MagY = 15; 
	   #10;  MagX = 15; 	
		#10;
		Izquierda = 0;
		Derecha = 0;
		Arriba = 0;
		Abajo = 0;
		Click = 1;
		
	end
      
always
begin
#1 clk <= ~clk; 
end 

endmodule

