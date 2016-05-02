`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:04:17 05/02/2016 
// Design Name: 
// Module Name:    TitleText 
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
module TitleText(
	 input [9:0] HCount,
	 input [9:0] VCount,
	 output reg titleon,
    output reg [2:0] rgb
    );
	 
localparam width = 216;
localparam height = 36;

reg [9:0] pos_x_l, pos_x_r;
reg [9:0] pos_y_t, pos_y_b;

assign title_sq = ((pos_x_l <= HCount) && (HCount <= pos_x_r) &&
						(pos_y_t <= VCount) && (VCount <= pos_y_b));

wire [5:0] addr;
wire [7:0] col;
wire [215:0] data;

ROM_Title text (
	.addr(addr),
	.data(data)
	);

assign addr = VCount[9:0] - pos_y_t[9:0];
assign col = HCount[9:0] - pos_x_l[9:0];

always @*
begin
	pos_x_l <= 10'd225;
	pos_y_t <= 10'd5;
	
	pos_x_r <= (pos_x_l + width - 1);
	pos_y_b <= (pos_y_t + height - 1);
	
	if( title_sq & data[col] )begin
		rgb <= 3'b001;
		titleon <= 1;
	end else begin
		rgb <= 3'b0;
		titleon <= 0;
	end
end
endmodule
