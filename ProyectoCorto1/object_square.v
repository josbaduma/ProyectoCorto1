`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:14:39 03/27/2016 
// Design Name: 
// Module Name:    object_square 
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
module object_square(
    input [9:0] HCount,
    input [9:0] VCount,
	 input square_select,
	 input full_screen,
    output reg square_on
    );

///-------------Parametros del cuadrado------------//
localparam square_width = 110;
localparam square_height = 110;

reg [9:0] square_x_l, square_x_r;

reg [9:0] square_y_t, square_y_b;

//Sincronizacion de los registros y verificadores de variable
always @* begin
	if(square_select && full_screen) begin
		square_x_l <= 9'd264;
		square_y_t <= 9'd182;
		square_on <= ((square_x_l <= HCount) && (HCount <= square_x_r) &&
						  (square_y_t <= VCount) && (VCount <= square_y_b));
	end
	else if ( ~square_select && full_screen)
		square_on <= 1'b0;
	else begin
		square_x_l <= 9'd264;
		square_y_t <= 9'd48;
		square_on <= ((square_x_l <= HCount) && (HCount <= square_x_r) &&
							(square_y_t <= VCount) && (VCount <= square_y_b));
	end
	square_x_r <= (square_x_l + square_width - 1);
	square_y_b <= (square_y_t + square_height - 1);
end

endmodule
