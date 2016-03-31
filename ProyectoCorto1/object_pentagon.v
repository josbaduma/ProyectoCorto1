`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:27:54 03/28/2016 
// Design Name: 
// Module Name:    object_pentagon 
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
module object_pentagon(
    input [9:0] HCount,
    input [9:0] VCount,
	 input pentagon_select,
	 input full_screen,
    output reg pentagon_on
    );

///-------------Parametros del pentagono------------//
localparam pentagon_width = 200;
localparam pentagon_height = 145;

reg [9:0] pentagon_x_l, pentagon_x_r;
reg [9:0] pentagon_y_t, pentagon_y_b;

assign pentagon_sq = ((pentagon_x_l <= HCount) && (HCount <= pentagon_x_r) &&
							 (pentagon_y_t <= VCount) && (VCount <= pentagon_y_b));

wire [7:0] pentagon_addr;
wire [7:0] pentagon_col;
wire [199:0] pentagon_data;

//Memoria ROM que contiene mapa de bit del pentagono
ROM_Pentagon pentagon (
	.addr(pentagon_addr),
	.data(pentagon_data)
	);
	
assign pentagon_addr = VCount[9:0] - pentagon_y_t[9:0];
assign pentagon_col = HCount[9:0] - pentagon_x_l[9:0];

assign pentagon_bit = pentagon_data[pentagon_col];

//Sincronizacion de los registros y verificadores de variable
always @* begin
	if(pentagon_select && full_screen) begin
		pentagon_x_l <= 9'd214;
		pentagon_y_t <= 9'd172;
		pentagon_on <= pentagon_sq & pentagon_bit;
	end
	else if (pentagon_select == 0 && full_screen)
		pentagon_on <= 1'b0;
	else begin
		pentagon_x_l <= 9'd220;
		pentagon_y_t <= 9'd318;
		pentagon_on <= pentagon_sq & pentagon_bit;
	end
	pentagon_x_r <= (pentagon_x_l + pentagon_width - 1);
	pentagon_y_b <= (pentagon_y_t + pentagon_height - 1);
end

endmodule
