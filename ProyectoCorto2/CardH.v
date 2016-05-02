`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:06 05/01/2016 
// Design Name: 
// Module Name:    CardH 
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
module CardH(
    input clk,
	 input [3:0] pos,
	 input enable,
	 input [9:0] HCount,
	 input [9:0] VCount,
	 output reg cardon,
    output reg [8:0] rgb
    );
	 
localparam width = 100;
localparam height = 100;

reg [9:0] pos_x_l, pos_x_r;
reg [9:0] pos_y_t, pos_y_b;

assign card_sq = ((pos_x_l <= HCount) && (HCount <= pos_x_r) &&
						(pos_y_t <= VCount) && (VCount <= pos_y_b));

wire [13:0] addr;
wire [9:0] pixel_x, pixel_y;
wire [8:0] data;

ROM_CardD card (
	.clk(clk),
	.addr(addr),
	.data(data)
	);

assign pixel_x = VCount[9:0] - pos_y_t[9:0];
assign pixel_y = HCount[9:0] - pos_x_l[9:0];
assign addr = (pixel_x * width) + pixel_y;


always @(posedge clk)
begin
	case(pos)
		4'b0000:	begin pos_x_l <= 9'd121;
							pos_y_t <= 9'd60;
					end
		4'b0001:	begin pos_x_l <= 9'd221;
							pos_y_t <= 9'd60;
					end
		4'b0010:	begin pos_x_l <= 9'd321;
							pos_y_t <= 9'd60;
					end
		4'b0011:	begin pos_x_l <= 9'd421;
							pos_y_t <= 9'd60;
					end
		4'b0100:	begin pos_x_l <= 9'd121;
							pos_y_t <= 9'd160;
					end
		4'b0101:	begin pos_x_l <= 9'd221;
							pos_y_t <= 9'd160;
					end
		4'b0110:	begin pos_x_l <= 9'd321;
							pos_y_t <= 9'd160;
					end
		4'b0111:	begin pos_x_l <= 9'd421;
							pos_y_t <= 9'd160;
					end
		4'b1000:	begin pos_x_l <= 9'd121;
							pos_y_t <= 9'd260;
					end
		4'b1001:	begin pos_x_l <= 9'd221;
							pos_y_t <= 9'd260;
					end
		4'b1010:	begin pos_x_l <= 9'd321;
							pos_y_t <= 9'd260;
					end
		4'b1011:	begin pos_x_l <= 9'd421;
							pos_y_t <= 9'd260;
					end
		4'b1100:	begin pos_x_l <= 9'd121;
							pos_y_t <= 9'd360;
					end
		4'b1101:	begin pos_x_l <= 9'd221;
							pos_y_t <= 9'd360;
					end
		4'b1110:	begin pos_x_l <= 9'd321;
							pos_y_t <= 9'd360;
					end
		4'b1111:	begin pos_x_l <= 9'd421;
							pos_y_t <= 9'd360;
					end
		default: begin pos_x_l <= 9'd121;
							pos_y_t <= 9'd60;
					end
	endcase
	pos_x_r <= (pos_x_l + width - 1);
	pos_y_b <= (pos_y_t + height - 1);
end

always @(posedge clk)
begin
	if( card_sq )begin
		rgb <= data;
		cardon <= 1;
	end else begin
		rgb <= 9'b0;
		cardon <= 0;
	end
end

endmodule
