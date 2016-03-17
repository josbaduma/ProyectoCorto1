`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:07 03/15/2016 
// Design Name: 
// Module Name:    VGA_Controller 
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
module VGA_Controller(
    input clk,
    input rst,
	 input [1:0] inRGB,
    output reg HSync,
    output reg VSync,
    output [2:0] RGB
    );

//Dimensiones de la pantalla
localparam H_size = 640;
localparam V_size = 480;

//Bordes de la pantalla
localparam H_Front = 48;
localparam H_Back = 16;
localparam V_Front = 10;
localparam V_Back = 33;

//Retrazos
localparam H_Retrace = 96;
localparam V_Retrace = 2;

//Variables del contador
reg [3:0] HCount, VCount;
reg [3:0] HCountNext, VCountNext;

//Parametros locales para la señal de salida
reg State, StateNext;

//Estados de la señal
assign HEnd = (HCount == (H_size + H_Front + H_Back + H_Retrace - 1)); //Verifica contador Horizontal
assign VEnd = (VCount == (V_size + V_Front + V_Back + V_Retrace - 1));//Verifica contador Vertical

//Sincronizacion de señales
always @(posedge clk or negedge rst)
begin
	if(rst == 0)
	begin
		HCount = 0;
		VCount = 0;
	end
	else begin
		if (HEnd)
			HCount = HCountNext;
		if (VEnd)
			VCount = VCountNext;
		else 
		begin
			HCount = 0;
			VCount = 0;
		end
	end
end

//Contadores vertical y horizontal
always @(HCount, VCount)
begin
	HCountNext = HCount + 1;
	VCountNext = VCount + 1;
end

//Cambios de estado en la maquina
always @(State)
begin
	case(State)
		0: if()
				StateNext = 1;				
		1: if()
				StateNext = 1;
		2: if()
				StateNext = 1;
		3: if((HCount_reg >= (H_size + H_Back) && HCount_reg <= (H_size + H_Back + H_Retrace - 1)) &&
				(VCount_reg >= (V_size + V_Back) && VCount_reg <= (V_size + V_Back + V_Retrace - 1)))
			StateNext = 3;
		default: StateNext = 0;
	endcase
end

//
always @(posedge clk or posedge rst) begin
	if (rst == 1) State = 0;
	else begin State = StateNext; end
end

//Señales de salida
always @(State) begin
	if(State == 0) begin HSync = 0; VSync = 0; end
	else if(State == 1) begin HSync = 1; VSync = 0; end
	else if(State == 0) begin HSync = 0; VSync = 1; end
	else begin HSync = 1; VSync = 1; end
end
	
//Asignacion de colores
assign RGB[0] = 1;
assign RGB[1] = inRGB[0];
assign RGB[2] = inRGB[1];

endmodule 