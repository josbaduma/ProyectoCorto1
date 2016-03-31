`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:45:02 03/28/2016 
// Design Name: 
// Module Name:    object_star 
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
module object_star(
    input [9:0] HCount,
    input [9:0] VCount,
	 input star_select,
	 input full_screen,
    output reg star_on
    );

///-------------Parametros de la estrella ------------//
localparam star_width = 200;
localparam star_height = 145;

reg [9:0] star_x_l, star_x_r;
reg [9:0] star_y_t, star_y_b;

assign star_sq = ((star_x_l <= HCount) && (HCount <= star_x_r) &&
							(star_y_t <= VCount) && (VCount <= star_y_b));

wire [7:0] star_addr;
wire [7:0] star_col;
wire [199:0] star_data;

//Memoria ROM que contiene mapa de bit de la estrella
ROM_Star star (
	.addr(star_addr),
	.data(star_data)
	);
	
assign star_addr = VCount[9:0] - star_y_t[9:0];
assign star_col = HCount[9:0] - star_x_l[9:0];

assign star_bit = star_data[star_col];

//Sincronizacion de los registros y verificadores de variable
always @* begin
	if(star_select && full_screen) begin
		star_x_l <= 9'd214;
		star_y_t <= 9'd172;
		star_on <= star_sq & star_bit;
	end
	else if (star_select == 0 && full_screen)
		star_on <= 1'b0;
	else begin
		star_x_l <= 9'd434;
		star_y_t <= 9'd318;
		star_on <= star_sq & star_bit;
	end
	star_x_r <= (star_x_l + star_width - 1);
	star_y_b <= (star_y_t + star_height - 1);
end

endmodule
