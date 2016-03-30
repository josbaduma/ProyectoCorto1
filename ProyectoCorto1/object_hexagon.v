`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:34:55 03/28/2016 
// Design Name: 
// Module Name:    object_hexagon 
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
module object_hexagon(
    input [9:0] HCount,
    input [9:0] VCount,
	 input hexagon_select,
	 input full_screen,
    output reg hexagon_on
    );

///-------------Parametros del hexagono------------//
localparam hexagon_width = 200;
localparam hexagon_height = 145;

reg [9:0] hexagon_x_l, hexagon_x_r;
reg [9:0] hexagon_y_t, hexagon_y_b;

assign hexagon_sq = ((hexagon_x_l <= HCount) && (HCount <= hexagon_x_r) &&
							(hexagon_y_t <= VCount) && (VCount <= hexagon_y_b));

wire [7:0] hexagon_addr;
wire [7:0] hexagon_col;
wire [207:0] hexagon_data;

//Memoria ROM que contiene mapa de bit del hexagono
ROM_Hexagon hexagon (
	.addr(hexagon_addr),
	.data(hexagon_data)
	);
	
assign hexagon_addr = VCount[9:0] - hexagon_y_t[9:0];
assign hexagon_col = HCount[9:0] - hexagon_x_l[9:0];

assign hexagon_bit = hexagon_data[hexagon_col];

//Sincronizacion de los registros y verificadores de variable
always @* begin
	if(hexagon_select && full_screen) begin
		hexagon_x_l <= 9'd214;
		hexagon_y_t <= 9'd172;
		hexagon_on <= hexagon_sq & hexagon_bit;
	end
	else if (hexagon_select == 0 && full_screen)
		hexagon_on <= 1'b0;
	else begin
		hexagon_x_l <= 9'd6;
		hexagon_y_t <= 9'd318;
		hexagon_on <= hexagon_sq & hexagon_bit;
	end
	hexagon_x_r <= (hexagon_x_l + hexagon_width - 1);
	hexagon_y_b <= (hexagon_y_t + hexagon_height - 1);
end

endmodule
