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
    output reg text_top_on
    );

//------- Parametros y funcionalidad para mostrar el texto arriba ------//
localparam text_top_width = 210;
localparam text_top_height = 25;

reg [9:0] text_top_x_l, text_top_x_r;
reg [9:0] text_top_y_t, text_top_y_b;

assign text_top_sq = ((text_top_x_l <= HCount) && (HCount <= text_top_x_r) &&
							 (text_top_y_t <= VCount) && (VCount <= text_top_y_b));

wire [7:0] text_top_addr;
wire [7:0] text_top_col;
wire [209:0] text_top_data;

ROM_TextTop text_top (
	.addr(text_top_addr),
	.data(text_top_data)
);

assign text_top_addr = VCount[9:0] - text_top_y_t[9:0];
assign text_top_col = HCount[9:0] - text_top_x_l[9:0];

assign text_top_bit = text_top_data[text_top_col];

//Sincronizacion de los registros y verificadores de variable
always @* begin
	text_top_x_l <= 9'd214;
	text_top_y_b <= 9'd0;
	text_top_x_r <= (text_top_x_l + text_top_width - 1);
	text_top_y_b <= (text_top_y_t + text_top_height - 1);
	
	text_top_on <= text_top_sq & text_top_bit;
end

endmodule
