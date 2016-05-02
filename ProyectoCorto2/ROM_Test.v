`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:49:23 05/02/2016
// Design Name:   ROM_Title
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/ROM_Test.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ROM_Title
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ROM_Test;

	// Inputs
	reg [5:0] addr;

	// Outputs
	wire [215:0] data;

	// Instantiate the Unit Under Test (UUT)
	ROM_Title uut (
		.addr(addr), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		addr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10; addr = 23;
		#10; addr = 6;
		#10; addr = 15;
	end
      
endmodule

