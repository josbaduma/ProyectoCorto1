`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:01:34 04/26/2016
// Design Name:   Freq_Covesor_Mouse
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Controladormouse/freq_test.v
// Project Name:  Controladormouse
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Freq_Covesor_Mouse
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module freq_test;

	// Inputs
	reg Clk;

	// Outputs
	wire New_Clk;

	// Instantiate the Unit Under Test (UUT)
	Freq_Covesor_Mouse uut (
		.Clk(Clk), 
		.New_Clk(New_Clk)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

	end
always
begin
#1 Clk <= ~Clk; 
end 

endmodule

