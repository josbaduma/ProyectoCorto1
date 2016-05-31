`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:43 05/27/2016 
// Design Name: 
// Module Name:    Nave 
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
module Nave(
    input [9:0] HCount,
    input [9:0] VCount,
    output reg nave_on,
    output reg [2:0] nave_rgb
    );

localparam width = 50;
localparam height = 50;

reg [9:0] pos_x_l, pos_x_r;
reg [9:0] pos_y_t, pos_y_b;

wire [5:0] addr;
wire [9:0] col;
wire [49:0] data;
reg nave_sq;

ROM_Nave nave (
	.addr(addr),
	.data(data)
	);

assign addr = VCount[9:0] - pos_y_t[9:0];
assign col = HCount[9:0] - pos_x_l[9:0];

always @* begin
	pos_x_l <= 10'd294;
	pos_y_t <= 10'd389;
	
	pos_x_r <= (pos_x_l + width - 1);
	pos_y_b <= (pos_y_t + height - 1);

	nave_sq <= ((pos_x_l <= HCount) && (HCount <= pos_x_r) &&
	  			   (pos_y_t <= VCount) && (VCount <= pos_y_b));

	if( nave_sq & data[col] ) begin
		nave_rgb = 3'b001;
		nave_on = 1;
	end else
		nave_on = 0;
end

endmodule
