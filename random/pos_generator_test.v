`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:30:00 04/29/2016
// Design Name:   pos_generator
// Module Name:   C:/Users/AndresMaria/Documents/Taller en Sistemas Digitales/random/pos_generator_test.v
// Project Name:  random
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pos_generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module pos_generator_test;

	// Inputs
	reg FPGA_Clk;

	// Outputs
	wire [9:0] card1X;
	wire [9:0] card1Y;
	wire [9:0] card2X;
	wire [9:0] card2Y;
	wire [9:0] card3X;
	wire [9:0] card3Y;
	wire [9:0] card4X;
	wire [9:0] card4Y;
	wire [9:0] card5X;
	wire [9:0] card5Y;
	wire [9:0] card6X;
	wire [9:0] card6Y;
	wire [9:0] card7X;
	wire [9:0] card7Y;
	wire [9:0] card8X;
	wire [9:0] card8Y;
	wire [9:0] card9X;
	wire [9:0] card9Y;
	wire [9:0] card10X;
	wire [9:0] card10Y;
	wire [9:0] card11X;
	wire [9:0] card11Y;
	wire [9:0] card12X;
	wire [9:0] card12Y;
	wire [9:0] card13X;
	wire [9:0] card13Y;
	wire [9:0] card14X;
	wire [9:0] card14Y;
	wire [9:0] card15X;
	wire [9:0] card15Y;
	wire [9:0] card16X;
	wire [9:0] card16Y;
	wire [3:0] c;/////
	wire d;
	wire e;

	// Instantiate the Unit Under Test (UUT)
	pos_generator uut (
		.FPGA_Clk(FPGA_Clk), 
		.card1X(card1X), 
		.card1Y(card1Y), 
		.card2X(card2X), 
		.card2Y(card2Y), 
		.card3X(card3X), 
		.card3Y(card3Y), 
		.card4X(card4X), 
		.card4Y(card4Y), 
		.card5X(card5X), 
		.card5Y(card5Y), 
		.card6X(card6X), 
		.card6Y(card6Y), 
		.card7X(card7X), 
		.card7Y(card7Y), 
		.card8X(card8X), 
		.card8Y(card8Y), 
		.card9X(card9X), 
		.card9Y(card9Y), 
		.card10X(card10X), 
		.card10Y(card10Y), 
		.card11X(card11X), 
		.card11Y(card11Y), 
		.card12X(card12X), 
		.card12Y(card12Y), 
		.card13X(card13X), 
		.card13Y(card13Y), 
		.card14X(card14X), 
		.card14Y(card14Y), 
		.card15X(card15X), 
		.card15Y(card15Y), 
		.card16X(card16X), 
		.card16Y(card16Y),
		.c(c),
		.d(d),
		.e(e)
	);

	initial begin
		// Initialize Inputs
		FPGA_Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
always
begin
#1 FPGA_Clk <= ~FPGA_Clk;
end 
endmodule

