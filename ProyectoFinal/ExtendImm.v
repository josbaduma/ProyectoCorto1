`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:43:59 05/12/2016 
// Design Name: 
// Module Name:    ExtendImm 
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
module ExtendImm(
	 input [1:0] CondExtend,
    input [23:0] Immediate,
    output reg [31:0] ExtImm
    );

always @* begin
	case(CondExtend)
	2'b00: begin
		ExtImm[31:8] <= 20'b0;
		ExtImm[7:0] <= Immediate[7:0];
	end	
	2'b01: begin
		ExtImm[31:12] <= 20'b0;
		ExtImm[11:0] <= Immediate[11:0];
	end
	2'b10: begin
		ExtImm[31:24] <= Immediate[23];
		ExtImm[23:0] <= (Immediate[23:0] * 4);
	end
	
	endcase
end

endmodule
