`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:56:54 04/17/2016
// Design Name:   controlMouse
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Controladormouse/controlMouse_Test.v
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

module controlMouse_Test;

	// Inputs
	reg Clk;
	reg M_CLK;
	reg bidi;

	// Bidirs
	wire M_Dat;

	// Instantiate the Unit Under Test (UUT)
	controlMouse uut (
		.Clk(Clk), 
		.M_CLK(M_CLK), 
		.M_Dat(M_Dat)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		M_CLK = 1;
		bidi = 1'bZ;

		// Wait 10 ns for global reset to finish
		#10;
        
		// Add stimulus here
      ///////////////////////////////////cambiar
		#10; M_CLK = 1; bidi = 1;
		#10; bidi = 0;
		#10; bidi = 1;
		#10; M_CLK = 0; bidi = 0;/////0 1
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;
		#1; M_CLK = 1; bidi = 1;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;//////old 11
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;//////1 11
		#1; M_CLK = 1; bidi = 1;//////1 11
		#1; M_CLK = 0; bidi = 0;//////0
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
		#1; M_CLK = 0; bidi = 1;//////1 11
		#1; M_CLK = 1; bidi = 1;//////1 11
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
		#1; M_CLK = 0; bidi = 0;
		#1; M_CLK = 1; bidi = 0;
		#1; M_CLK = 0; bidi = 1;//////1 11
		#1; M_CLK = 1; bidi = 1;//////1 11
		//#1; M_CLK = 1; bidi = 0;
		//#1; M_CLK = 0; bidi = 0;//////1 33                      
									 
	   //#1; M_CLK = 1; bidi = 1;//////0 34
	end
	
	assign  M_Dat = bidi; 

always
begin
#1 Clk <= ~Clk;
end   
endmodule

