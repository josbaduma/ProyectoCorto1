`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:37:12 03/23/2016
// Design Name:   CoreModule
// Module Name:   C:/XilinxProjects/ProyectoCorto1/CoreModule_Test.v
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

module CoreModule_Test;

	// Inputs
	reg clk;
	reg rst;
	reg [1:0] inrgb;

	// Outputs
	wire HSync;
	wire VSync;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	CoreModule uut (
		.clk(clk), 
		.rst(rst), 
		.inrgb(inrgb), 
		.HSync(HSync), 
		.VSync(VSync), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		inrgb = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clk);
			#5; rst = 1;
		@(posedge clk);
			#5; rst = 0;
			
					
		#50; inrgb = 2'b00;
		#50; inrgb = 2'b01;
		#50; inrgb = 2'b10;
		#50; inrgb = 2'b11;
		
	end
	
   always begin
		clk <= 0;
		#5;
		clk <= 1;
		#5;
	end
endmodule

