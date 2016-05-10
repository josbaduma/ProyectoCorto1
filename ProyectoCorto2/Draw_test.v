`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:44:23 05/02/2016
// Design Name:   DrawSystem
// Module Name:   C:/Users/joseb/Documents/GitHub/Taller-Digital/ProyectoCorto2/Draw_test.v
// Project Name:  ProyectoCorto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DrawSystem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Draw_test;

	// Inputs
	reg [9:0] HCount;
	reg [9:0] VCount;
	reg [15:0] regCard;
	reg [3:0] posA;
	reg [3:0] posB;
	reg [3:0] posC;
	reg [3:0] posD;
	reg [3:0] posE;
	reg [3:0] posF;
	reg [3:0] posG;
	reg [3:0] posH;
	reg [3:0] posI;
	reg [3:0] posJ;
	reg [3:0] posK;
	reg [3:0] posL;
	reg [3:0] posM;
	reg [3:0] posN;
	reg [3:0] posO;
	reg [3:0] posP;

	// Outputs
	wire [16:0] selRGB;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	DrawSystem uut (
		.HCount(HCount), 
		.VCount(VCount), 
		.regCard(regCard),
		.posA(posA), 
		.posB(posB), 
		.posC(posC), 
		.posD(posD), 
		.posE(posE), 
		.posF(posF), 
		.posG(posG), 
		.posH(posH), 
		.posI(posI), 
		.posJ(posJ), 
		.posK(posK), 
		.posL(posL), 
		.posM(posM), 
		.posN(posN), 
		.posO(posO), 
		.posP(posP),
		.selRGB(selRGB),
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		HCount = 0;
		VCount = 0;
		regCard = 0;
		posA = 0;
		posB = 1;
		posC = 2;
		posD = 3;
		posE = 4;
		posF = 5;
		posG = 6;
		posH = 7;
		posI = 8;
		posJ = 9;
		posK = 10;
		posL = 11;
		posM = 12;
		posN = 13;
		posO = 14;
		posP = 15;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
			#5; HCount <= 140;
				 VCount <= 75;
				 regCard <= 1;
			#50; HCount <= 140;
				  VCount <= 75;
				  regCard <= 0;
			
			#50; HCount <= 240;
				  VCount <= 75;
				  regCard <= 2;
			#50; HCount <= 240;
				 VCount <= 75;
				 regCard <= 0;
	end
      
endmodule

