`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:11:17 04/28/2016
// Design Name:   controlMouse
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Controladormouse/mouse_test.v
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

module mouse_test;

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
	wire [31:0] c;/////

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
		.c(c)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		M_CLK = 1;
      bidi = 1'bZ;
		// Wait 100 ns for global reset to finish
		#1; M_CLK = 1;
		#1; M_CLK = 0;
		#1; M_CLK = 1; 
		#1; M_CLK = 0;
		#1; M_CLK = 1;
		#1; M_CLK = 0;
		#1; M_CLK = 1;
		#1; M_CLK = 0;
		#1; M_CLK = 1;
		#1; M_CLK = 0;
		#1; M_CLK = 1; 
		#1; M_CLK = 0;
		#1; M_CLK = 1;
		#1; M_CLK = 0;
		#1; M_CLK = 1;
		#1; M_CLK = 0;
		#1; M_CLK = 1;
		#1; M_CLK = 0;
		#1; M_CLK = 1;
		#1; M_CLK = 0;
		#1; M_CLK = 1;
		
		
		#25;
        
		// Add stimulus here
      M_CLK = 1; bidi = 1;	

		#1; M_CLK = 0;bidi = 0;
		#1; M_CLK = 1;bidi = 0;
		#1; M_CLK = 0;bidi = 1;
		#1; M_CLK = 1;bidi = 1;
		#1; M_CLK = 0;bidi = 0;
		#1; M_CLK = 1;bidi = 0;
		#1; M_CLK = 0;bidi = 1;
		#1; M_CLK = 1;bidi = 1;
		#1; M_CLK = 0;bidi = 0;
		#1; M_CLK = 1;bidi = 0;
		#1; M_CLK = 0;bidi = 1;
		#1; M_CLK = 1;bidi = 1; 
		
		#10; M_CLK = 1; bidi = 1;
		
		
		
		#1; M_CLK = 0; bidi = 0;/////0 1
		#1; M_CLK = 1; bidi = 0; 
		#1; M_CLK = 0; bidi = 0;/////fijo
		#1; M_CLK = 1; bidi = 0;////
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;//////old 11
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;//////1 11
		#1; M_CLK = 1; bidi = 1;//////1 11
		#10; M_CLK = 0; bidi = 0;//////0
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
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
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;//////1 22
		#1; M_CLK = 1; bidi = 1;//////1 22
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
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;//////1 32
		#1; M_CLK = 1; bidi = 0;//////1 32
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;//////1 33                      
			
		
		
		
		#100; M_CLK = 0; bidi = 0;/////0 1
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
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
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
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;//////1 32
		#1; M_CLK = 1; bidi = 0;//////1 32
		#1; M_CLK = 0; bidi = 1;
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

