`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:00:17 04/26/2016
// Design Name:   MemoryFSM
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/FSM_test.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoryFSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_test;

	// Inputs
	reg clk;
	reg rst;
	reg [4:0] value;

	// Outputs
	wire [15:0] cardreg;

	// Instantiate the Unit Under Test (UUT)
	MemoryFSM uut (
		.clk(clk), 
		.rst(rst), 
		.value(value),
		.cardreg(cardreg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		value = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		@(posedge clk)
			#20; rst = 1;
		@(posedge clk);
			#20; rst = 0; #20;
		@(posedge clk)
			value = 13; #100;
		@(posedge clk)
			value = 14; #100;
		@(posedge clk)
			value = 0; #600;
		@(posedge clk)
			value = 2; #100;
		@(posedge clk)
			value = 9; #100;
		@(posedge clk)
			value = 0; #600;
	end
	
	always begin
		clk <= 1;
		#20;
		clk <= 0;
		#20;
	end
      
endmodule

