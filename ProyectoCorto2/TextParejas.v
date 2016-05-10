`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:53:28 05/09/2016 
// Design Name: 
// Module Name:    TextParejas 
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
module TextParejas(
    input [9:0] HCount,
    input [9:0] VCount,
    output reg texton,
    output reg [2:0] rgbtext
    );

localparam width = 108;
localparam height = 26;

reg [9:0] pos_x_l, pos_x_r;
reg [9:0] pos_y_t, pos_y_b;

assign text_sq = ((pos_x_l <= HCount) && (HCount <= pos_x_r) &&
						(pos_y_t <= VCount) && (VCount <= pos_y_b));

reg [5:0] addr;
reg [7:0] col;
wire [215:0] data;

ROM_Text text (
	.addr(addr),
	.data(data)
	);
	
always @* begin
	pos_x_l <= 10'd10;
	pos_y_t <= 10'd150;
	
	pos_x_r <= (pos_x_l + width - 1);
	pos_y_b <= (pos_y_t + height - 1);
	
	addr <= VCount[9:0] - pos_y_t[9:0];
	col <= HCount[9:0] - pos_x_l[9:0];
	
	texton <= (text_sq & data[col]);
		rgbtext <= 3'b001;
end

endmodule
