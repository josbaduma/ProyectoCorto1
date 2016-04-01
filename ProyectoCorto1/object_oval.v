`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:41:44 03/27/2016 
// Design Name: 
// Module Name:    object_oval 
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
module object_oval(
    input [9:0] HCount,
    input [9:0] VCount,
	 input full_screen,
	 input oval_select,
    output reg oval_on
    );

localparam oval_width = 200;
localparam oval_height = 145;

reg [9:0] oval_x_l, oval_x_r;
reg [9:0] oval_y_t, oval_y_b;

assign oval_sq = ((oval_x_l <= HCount) && (HCount <= oval_x_r) &&
							(oval_y_t <= VCount) && (VCount <= oval_y_b));

wire [7:0] oval_addr;
wire [7:0] oval_col;
wire [199:0] oval_data;

//Memoria ROM que contiene mapa de bit del triangulo
ROM_Oval oval (
	.addr(oval_addr),
	.data(oval_data)
	);
	
assign oval_addr = VCount[9:0] - oval_y_t[9:0];
assign oval_col = HCount[9:0] - oval_x_l[9:0];

assign oval_bit = oval_data[oval_col];

//Sincronizacion de los registros y verificadores de variable
always @* begin
	if(oval_select && full_screen) begin
		oval_x_l <= 9'd214;
		oval_y_t <= 9'd172;
		oval_on <= oval_sq & oval_bit;
	end
	else if (~oval_select && full_screen)
		oval_on <= 1'b0;
	else begin
		oval_x_l <= 9'd6;
		oval_y_t <= 9'd172;
		oval_on <= oval_sq & oval_bit;
	end
	oval_x_r <= (oval_x_l + oval_width - 1);
	oval_y_b <= (oval_y_t + oval_height - 1);
end

endmodule
