`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:38:35 05/01/2016 
// Design Name: 
// Module Name:    CardC 
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
module CardC(
	 input [3:0] pos,
	 input enable,
	 input [9:0] HCount,
	 input [9:0] VCount,
	 output reg cardon,
    output reg [2:0] rgb
    );
	 
localparam width = 90;
localparam height = 90;

reg [9:0] pos_x_l, pos_x_r;
reg [9:0] pos_y_t, pos_y_b;
reg card_sq;

wire [6:0] addr;
wire [9:0] col;
wire [269:0] data;

ROM_CardB card (
	.addr(addr),
	.data(data)
	);

assign addr = VCount[9:0] - pos_y_t[9:0];
assign col = (HCount[9:0] - pos_x_l[9:0]) * 3;

always @*
begin
	case(pos)
		4'b0000:	begin pos_x_l <= 10'd130;
							pos_y_t <= 10'd70;
					end
		4'b0001:	begin pos_x_l <= 10'd230;
							pos_y_t <= 10'd70;
					end
		4'b0010:	begin pos_x_l <= 10'd330;
							pos_y_t <= 10'd70;
					end
		4'b0011:	begin pos_x_l <= 10'd430;
							pos_y_t <= 10'd70;
					end
		4'b0100:	begin pos_x_l <= 10'd130;
							pos_y_t <= 10'd170;
					end
		4'b0101:	begin pos_x_l <= 10'd230;
							pos_y_t <= 10'd170;
					end
		4'b0110:	begin pos_x_l <= 10'd330;
							pos_y_t <= 10'd170;
					end
		4'b0111:	begin pos_x_l <= 10'd430;
							pos_y_t <= 10'd170;
					end
		4'b1000:	begin pos_x_l <= 10'd130;
							pos_y_t <= 10'd270;
					end
		4'b1001:	begin pos_x_l <= 10'd230;
							pos_y_t <= 10'd270;
					end
		4'b1010:	begin pos_x_l <= 10'd330;
							pos_y_t <= 10'd270;
					end
		4'b1011:	begin pos_x_l <= 10'd430;
							pos_y_t <= 10'd270;
					end
		4'b1100:	begin pos_x_l <= 10'd130;
							pos_y_t <= 10'd370;
					end
		4'b1101:	begin pos_x_l <= 10'd230;
							pos_y_t <= 10'd370;
					end
		4'b1110:	begin pos_x_l <= 10'd330;
							pos_y_t <= 10'd370;
					end
		4'b1111:	begin pos_x_l <= 10'd430;
							pos_y_t <= 10'd370;
					end
		default: begin pos_x_l <= 10'd130;
							pos_y_t <= 10'd70;
					end
	endcase
	pos_x_r <= (pos_x_l + width - 1);
	pos_y_b <= (pos_y_t + height - 1);
end

always @*
begin
	card_sq <= ((pos_x_l <= HCount) && (HCount <= pos_x_r) &&
	  			  (pos_y_t <= VCount) && (VCount <= pos_y_b));

	if( enable == 0 && card_sq == 1) begin
		rgb <= 3'b100;
		cardon <= 1;
	end
	else if( enable == 1 && card_sq == 1 )begin
		rgb[0] <= data[col];
		rgb[1] <= data[col+1];
		rgb[2] <= data[col+2];
		cardon <= 1;
	end else begin
		rgb <= 3'b0;
		cardon <= 0;
	end
end

endmodule
