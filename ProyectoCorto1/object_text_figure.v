`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:11:09 04/02/2016 
// Design Name: 
// Module Name:    object_text_figure 
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
module object_text_figure(
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
    output text_figure_on
    );

localparam text_figure_width = 160;
localparam text_figure_height = 30;

localparam text_figure_x_l = 240, text_figure_y_t = 120;

localparam text_figure_x_r = (text_figure_x_l + text_figure_width - 1);
localparam text_figure_y_b = (text_figure_y_t + text_figure_height - 1);

assign text_figure_sq = ((text_figure_x_l <= HCount) && (HCount <= text_figure_x_r) &&
								 (text_figure_y_t <= VCount) && (VCount <= text_figure_y_b));

wire [8:0] text_figure_addr;
wire [7:0] text_figure_col;
wire [159:0] text_figure_data;
reg [3:0] fig_sel;

ROM_TextFigure text_figure (
	.addr(text_figure_addr),
	.data(text_figure_data)
);

assign text_figure_addr = VCount[9:0] - text_figure_y_t[9:0] + (fig_sel * 30);
assign text_figure_col = HCount[9:0] - text_figure_x_l[9:0];

assign text_figure_bit = text_figure_data[text_figure_col];
assign text_figure_on = text_figure_sq & text_figure_bit;

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

endmodule
