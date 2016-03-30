`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:20:25 03/27/2016 
// Design Name: 
// Module Name:    object_rectangle 
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
module object_rectangle(
    input [9:0] HCount,
    input [9:0] VCount,
	 input rectangle_select,
	 input full_screen,
    output reg rectangle_on
    );

//------------Parametros del rectangulo-----------//
localparam rectangle_width = 160;
localparam rectangle_height = 115;

reg [9:0] rectangle_x_l, rectangle_x_r;

reg [9:0] rectangle_y_t, rectangle_y_b;

//Sincronizacion de los registros y verificadores de variable
always @* begin
	if(rectangle_select && full_screen) begin
		rectangle_x_l <= 9'd240;
		rectangle_y_t <= 9'd178;
		rectangle_on <= ((rectangle_x_l <= HCount) && (HCount <= rectangle_x_r) &&
							  (rectangle_y_t <= VCount) && (VCount <= rectangle_y_b));
	end
	else if (rectangle_select == 0 && full_screen)
		rectangle_on <= 1'b0;
	else begin
		rectangle_x_l <= 9'd240;
		rectangle_y_t <= 9'd178;
		rectangle_on <= ((rectangle_x_l <= HCount) && (HCount <= rectangle_x_r) &&
							  (rectangle_y_t <= VCount) && (VCount <= rectangle_y_b));
	end
	rectangle_x_r <= (rectangle_x_l + rectangle_width - 1);
	rectangle_y_b <= (rectangle_y_t + rectangle_height - 1);
end

endmodule
