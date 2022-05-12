`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2021 20:44:18
// Design Name: 
// Module Name: alu
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


module alu(
input logic [3:0] rd0, rd1,
input logic [2:0] controlAlu,
output logic [3:0] result
);

always_comb
    case(controlAlu)
    3'b000: result = rd0;
    3'b001: result = rd1;
    3'b010: result = rd0 - rd1;
    3'b011: result = rd0 + rd1;
    3'b100: result = rd0 * rd1;
    3'b101: result = rd1 / rd0;
    default result = {4{1'bx}};
    endcase
    
endmodule
