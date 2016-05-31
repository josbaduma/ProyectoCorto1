`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:48 05/06/2016 
// Design Name: 
// Module Name:    mouse_led 
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
module mouse_led
   (
    input wire clk, reset,
    inout wire ps2d, ps2c,
    output reg [7:0] led
   );

   // signal declaration
   reg [9:0] p_reg;
   wire [9:0] p_next;
   wire [8:0] xm;
   wire [2:0] btnm;
   wire m_done_tick;
	
	wire clk1;

   // body
   // instantiation
	freq_conversor_mouse conv(clk,clk1);//(clk(Clk),clk1(New_Clk));
	
   mouse mouse_unit
      (.clk(clk1), .reset(reset), .ps2d(ps2d), .ps2c(ps2c),
       .xm(xm), .btnm(btnm),
       .m_done_tick(m_done_tick));

   // counter
   always @(posedge clk, posedge reset)
      if (reset)
         p_reg <= 0;
      else
         p_reg <= p_next;

   assign p_next = (~m_done_tick) ? p_reg  : // no activity
                   (btnm[0])      ? 10'b0  : // left button
                   (btnm[1])     ? 10'h3ff : // right button
                   p_reg + {xm[8], xm};      // x movement

   always @*
      case (p_reg[9:7])
         3'b000: led = 8'b10000000;
         3'b001: led = 8'b01000000;
         3'b010: led = 8'b00100000;
         3'b011: led = 8'b00010000;
         3'b100: led = 8'b00001000;
         3'b101: led = 8'b00000100;
         3'b110: led = 8'b00000010;
         default: led = 8'b00000001;
      endcase

endmodule