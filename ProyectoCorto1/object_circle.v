`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:33 03/27/2016 
// Design Name: 
// Module Name:    object_circle 
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
module object_circle(
    input [9:0] HCount,
    input [9:0] VCount,
	 input circle_select,
	 input completeScreen,
    output reg circle_on
    );

localparam circle_width = 200;
localparam circle_height = 145;

reg [9:0] circle_x_l, circle_x_r;

reg [9:0] circle_y_t = 26, circle_y_b;

assign circle_sq = ((circle_x_l <= HCount) && (HCount <= circle_x_r) &&
							(circle_y_t <= VCount) && (VCount <= circle_y_b));

wire [7:0] circle_addr;
wire [7:0] circle_col;
wire [199:0] circle_data;

//Memoria ROM que contiene mapa de bit del triangulo
ROM_Circle circle (
	.addr(circle_addr),
	.data(circle_data)
	);
	
assign circle_addr = VCount[9:0] - circle_y_t[9:0];
assign circle_col = HCount[9:0] - circle_x_l[9:0];

assign circle_bit = circle_data[circle_col];

//Bordes del selector
//assign bordeSelecA = ((4 <= HCount) && (HCount <= 211) && (3 <= VCount) && (VCount <= 4));
//assign bordeSelecB = ((4 <= HCount) && (HCount <= 211) && (156 <= VCount) && (VCount <= 157));
//assign bordeSelecC = ((4 <= HCount) && (HCount <= 5) && (3 <= VCount) && (VCount <= 157));
//assign bordeSelecD = ((210 <= HCount) && (HCount <= 211) && (3 <= VCount) && (VCount <= 157));
//
//assign bordeSelec_on = (bordeSelecA || bordeSelecB || bordeSelecC || bordeSelecD);

//Sincronizacion de los registros y verificadores de variable
always @* begin
	if(circle_select && completeScreen) begin
		circle_x_l <= 9'd214;
		circle_y_t <= 9'd172;
		circle_on <= circle_sq & circle_bit;
	end
	else if (circle_select == 0 && completeScreen)
		circle_on <= 1'b0;
	else begin
		circle_x_l <= 9'd6;
		circle_y_t <= 9'd26;
		circle_on <= circle_sq & circle_bit;
	end
	circle_x_r <= (circle_x_l + circle_width - 1);
	circle_y_b <= (circle_y_t + circle_height - 1);
end

endmodule
