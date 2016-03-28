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
    output oval_on
    );

localparam oval_width = 200;
localparam oval_height = 150;

localparam oval_x_l = 5;
localparam oval_x_r = oval_x_l + oval_width - 1;

localparam oval_y_t = 165;
localparam oval_y_b = oval_y_t + oval_height - 1;

assign oval_sq = ((oval_x_l <= HCount) && (HCount <= oval_x_r) &&
							(oval_y_t <= VCount) && (VCount <= oval_y_b));

wire [7:0] oval_addr;
wire [7:0] oval_col;
wire [207:0] oval_data;

//Memoria ROM que contiene mapa de bit del triangulo
ROM_Oval oval (
	.addr(oval_addr),
	.data(oval_data)
	);
	
assign oval_addr = VCount[9:0] - oval_y_t[9:0];
assign oval_col = HCount[9:0] - oval_x_l[9:0];

assign oval_bit = oval_data[oval_col];
assign oval_on = oval_sq & oval_bit;

endmodule
