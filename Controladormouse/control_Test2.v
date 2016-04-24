`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:40:33 04/22/2016
// Design Name:   controlMouse
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Controladormouse/control_Test2.v
// Project Name:  Controladormouse
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controlMouse
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_Test2;

	// Inputs
	reg Clk;
	reg M_CLK; 
	reg bidi;

	// Outputs
	wire Click;
	wire Izquierda;
	wire Derecha;
	wire Arriba;
	wire Abajo;
	wire [7:0] MagX;
	wire [7:0] MagY;
	wire [6:0] tmp;

	// Bidirs
	wire M_Dat;

	// Instantiate the Unit Under Test (UUT)
	controlMouse uut (
		.Clk(Clk), 
		.M_CLK(M_CLK), 
		.M_Dat(M_Dat), 
		.Click(Click), 
		.Izquierda(Izquierda), 
		.Derecha(Derecha), 
		.Arriba(Arriba), 
		.Abajo(Abajo), 
		.MagX(MagX), 
		.MagY(MagY),
		.tmp(tmp)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		M_CLK = 1;
      bidi = 1'bZ;
		// Wait 100 ns for global reset to finish
		#10;
      
		// Add stimulus here
      M_CLK = 1; bidi = 1;		
		#10; M_CLK = 0; bidi = 0;
		#10; M_CLK = 1; bidi = 1;
		#10; M_CLK = 0; bidi = 0;/////0 1
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;/////fijo
		#1; M_CLK = 1; bidi = 1;////
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 1;//////old 11
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;//////1 11
		#1; M_CLK = 1; bidi = 1;//////1 11
		#1; M_CLK = 0; bidi = 0;//////0
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;//////old 33
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;//////1 21
		#1; M_CLK = 1; bidi = 0;//////1 21
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;//////1 32
		#1; M_CLK = 1; bidi = 0;//////1 32
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 1;//////1 33                      
									 
	   #1; M_CLK = 0; bidi = 1;//////0 34
      #1; M_CLK = 1;
	end
   assign  M_Dat = bidi; 

always
begin
#1 Clk <= ~Clk;
end  
endmodule

