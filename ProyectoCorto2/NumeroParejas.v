`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:23 05/06/2016 
// Design Name: 
// Module Name:    NumeroParejas 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NumeroParejas(
    input [9:0] HCount,
    input [9:0] VCount,
    input [3:0] numSel,
    output reg numeroon,
    output reg [7:0] rgbnum
    );

localparam width = 14;
localparam height = 20;

reg [9:0] pos_x_l, pos_x_r;
reg [9:0] pos_y_t, pos_y_b;

reg [7:0] addr;
reg [9:0] col;
wire [13:0] data;

reg num_sq;

ROM_Numero num (
	.addr(addr),
	.data(data)
	);

always @* begin
	pos_x_l = 10;
	pos_y_t = 200;
	
	pos_x_r = (pos_x_l + width - 1);
	pos_y_b = (pos_y_t + height - 1);

	num_sq = ((pos_x_l <= HCount) && (HCount <= pos_x_r) &&
					(pos_y_t <= VCount) && (VCount <= pos_y_b));
					
	addr = VCount[9:0] - pos_y_t[9:0] + (numSel * 20);
	col = HCount[9:0] - pos_x_l[9:0];	

	numeroon = num_sq & data[col];
	
	rgbnum = 3'b011;
end

endmodule
