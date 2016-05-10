`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:26:55 05/08/2016
// Design Name:   freq_conversor_mouse
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Mouse_LED/freq_test.v
// Project Name:  Mouse_LED
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: freq_conversor_mouse
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
	freq_conversor_mouse uut (
		.Clk(Clk), 
		.New_Clk(New_Clk)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
always
begin
#5; Clk <= ~Clk;
end 
	

endmodule

