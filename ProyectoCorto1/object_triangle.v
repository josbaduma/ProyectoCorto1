`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:12:11 03/27/2016 
// Design Name: 
// Module Name:    object_triangle 
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
module object_triangle(
    input [9:0] HCount,
    input [9:0] VCount,
	 input triangle_select,
	 input full_screen,
    output reg triangle_on
    );

///-------------Parametros del triangulo------------//
localparam triangle_width = 200;
localparam triangle_height = 145;

reg [9:0] triangle_x_l, triangle_x_r;
reg [9:0] triangle_y_t, triangle_y_b;

assign triangle_sq = ((triangle_x_l <= HCount) && (HCount <= triangle_x_r) &&
							(triangle_y_t <= VCount) && (VCount <= triangle_y_b));

wire [7:0] triangle_addr;
wire [7:0] triangle_col;
wire [199:0] triangle_data;

//Memoria ROM que contiene mapa de bit del triangulo
ROM_Triangle triangle (
	.addr(triangle_addr),
	.data(triangle_data)
	);
	
assign triangle_addr = VCount[9:0] - triangle_y_t[9:0];
assign triangle_col = HCount[9:0] - triangle_x_l[9:0];

assign triangle_bit = triangle_data[triangle_col];

//Sincronizacion de los registros y verificadores de variable
always @* begin
	if(triangle_select && full_screen) begin
		triangle_x_l <= 9'd220;
		triangle_y_t <= 9'd172;
		triangle_on <= triangle_sq & triangle_bit;
	end
	else if (triangle_select == 0 && full_screen)
		triangle_on <= 1'b0;
	else begin
		triangle_x_l <= 9'd434;
		triangle_y_t <= 9'd26;
		triangle_on <= triangle_sq & triangle_bit;
	end
	triangle_x_r <= (triangle_x_l + triangle_width - 1);
	triangle_y_b <= (triangle_y_t + triangle_height - 1);
end

endmodule
