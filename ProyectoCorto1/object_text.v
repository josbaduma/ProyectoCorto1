`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:25 03/30/2016 
// Design Name: 
// Module Name:    object_text 
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
module object_text(
    input [9:0] HCount,
    input [9:0] VCount,
    output reg text_on
    );

localparam text_width = 200;
localparam text_height = 25;

reg [9:0] text_x_l, text_x_r;
reg [9:0] text_y_t, text_y_b;

assign text_sq = ((text_x_l <= HCount) && (HCount <= text_x_r) &&
						(text_y_t <= VCount) && (VCount <= text_y_b));

wire [7:0] text_addr;
wire [7:0] text_col;
wire [199:0] text_data;

ROM_Text text (
	.addr(text_addr),
	.data(text_data)
);

assign text_addr = VCount[9:0] - text_y_t[9:0];
assign text_col = HCount[9:0] - text_x_l[9:0];

assign text_bit = text_data[text_col];

//Sincronizacion de los registros y verificadores de variable
always @* begin
	text_x_l <= 9'd214;
	text_y_b <= 9'd0;
	text_x_r <= (text_x_l + text_width - 1);
	text_y_b <= (text_y_t + text_height - 1);
	
	text_on <= text_sq & text_bit;
end

endmodule
