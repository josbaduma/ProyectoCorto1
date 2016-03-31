`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:26:30 03/31/2016
// Design Name:   CoreModule
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/Taller-Digital/ProyectoCorto1/SelectorDeImagenes_Test.v
// Project Name:  ProyectoCorto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CoreModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SelectorDeImagenes_Test;

	// Inputs
	reg clk;
	reg rst;
	reg up0;
	reg down0;
	reg left0;
	reg right0;
	reg Select0;

	// Outputs
	wire HSync;
	wire VSync;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	CoreModule uut (
		.clk(clk), 
		.rst(rst), 
		.up0(up0), 
		.down0(down0), 
		.left0(left0), 
		.right0(right0), 
		.Select0(Select0), 
		.HSync(HSync), 
		.VSync(VSync), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		up0 = 0;
		down0 = 0;
		left0 = 0;
		right0 = 0;
		Select0 = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		#10;

	end
always 
begin
#10 Clk <=~Clk;
end   
endmodule

