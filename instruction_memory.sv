`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2021 22:43:40
// Design Name: 
// Module Name: instruction_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_memory(
input logic [2:0] pc, output logic [11:0] instr
    );
    logic [11:0] rom [7:0];
    
    always_comb
    begin
    rom[0] = 12'b000000000000;
    rom[1] = 12'b000000010001;
    rom[2] = 12'b001010000001;
    rom[3] = 12'b011011000001;
    rom[4] = 12'b100100000001;
    rom[5] = 12'b101101000001;
    rom[6] = 12'b010000110100;
    rom[7] = 12'b010101011001;
    end
    
    assign instr = rom[pc];
    
    
endmodule
