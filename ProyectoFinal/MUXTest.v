`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:50:05 05/12/2016
// Design Name:   MUX
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoFinal/MUXTest.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUXTest;

	// Inputs
	reg [31:0] DI1;
	reg [31:0] DI2;
	reg SelData;

	// Outputs
	wire [31:0] DO;

	// Instantiate the Unit Under Test (UUT)
	MUX uut (
		.DI1(DI1), 
		.DI2(DI2), 
		.SelData(SelData), 
		.DO(DO)
	);

	initial begin
		// Initialize Inputs
		DI1 = 0;
		DI2 = 0;
		SelData = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		DI1 = 56;
		DI2 = 83;
		SelData = 1;
		
		#100;
		
		DI1 = 56;
		DI2 = 83;
		SelData = 0;
	end
      
endmodule

