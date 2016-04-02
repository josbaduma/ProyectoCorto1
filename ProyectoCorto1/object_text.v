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
	 input circle_select,
	 input square_select,
	 input triangle_select,
	 input oval_select,
	 input rectangle_select,
	 input diamond_select,
	 input hexagon_select,
	 input pentagon_select,
	 input star_select,
    output reg text_top_on,
	 output reg text_bottom_on
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

//------- Parametros y funcionalidad para mostrar el texto abajo ------//
localparam text_bottom_width = 210;
localparam text_bottom_height = 15;

reg [9:0] text_bottom_x_l, text_bottom_x_r;
reg [9:0] text_bottom_y_t, text_bottom_y_b;

assign text_bottom_sq = ((text_bottom_x_l <= HCount) && (HCount <= text_bottom_x_r) &&
								 (text_bottom_y_t <= VCount) && (VCount <= text_bottom_y_b));

wire [7:0] text_bottom_addr;
wire [7:0] text_bottom_col;
wire [209:0] text_bottom_data;
reg [3:0] fig_sel;

ROM_TextBottom text_bottom (
	.addr(text_bottom_addr),
	.data(text_bottom_data)
);

assign text_bottom_addr = VCount[9:0] - text_bottom_y_t[9:0] + (fig_sel * 15);
assign text_bottom_col = HCount[9:0] - text_bottom_x_l[9:0];

assign text_bottom_bit = text_bottom_data[text_bottom_col];

//Sincronizacion de los registros y verificadores de variable
always @* begin
	if(circle_select) fig_sel <= 4'b0000;
	else if(square_select) fig_sel <= 4'b0001;
	else if(triangle_select) fig_sel <= 4'b0010;
	else if(oval_select) fig_sel <= 4'b0011;
	else if(rectangle_select) fig_sel <= 4'b0100;
	else if(diamond_select) fig_sel <= 4'b0101;
	else if(hexagon_select) fig_sel <= 4'b0110;
	else if(pentagon_select) fig_sel <= 4'b0111;
	else fig_sel <= 4'b1000;
end

always @* begin
	text_bottom_x_l <= 9'd214;
	text_bottom_y_b <= 9'd465;
	text_bottom_x_r <= (text_bottom_x_l + text_bottom_width - 1);
	text_bottom_y_b <= (text_bottom_y_t + text_bottom_height - 1);
	
	text_bottom_on <= text_bottom_sq & text_bottom_bit;
end

endmodule
