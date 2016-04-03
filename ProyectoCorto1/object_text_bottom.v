`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:34:19 04/02/2016 
// Design Name: 
// Module Name:    object_text_bottom 
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
module object_text_bottom(
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
    output text_bottom_on
    );

//------- Parametros y funcionalidad para mostrar el texto abajo ------//
localparam text_bottom_width = 210;
localparam text_bottom_height = 15;

localparam text_bottom_x_l = 214, text_bottom_y_t = 464;

localparam text_bottom_x_r = (text_bottom_x_l + text_bottom_width - 1);
localparam text_bottom_y_b = (text_bottom_y_t + text_bottom_height - 1);

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
assign text_bottom_on = text_bottom_sq & text_bottom_bit;

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
