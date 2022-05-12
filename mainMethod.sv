`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2021 22:08:20
// Design Name: 
// Module Name: mainMethod
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


module mainMethod(
input logic clk,
input logic reset,
input logic [2:0] pc
);

logic [11:0] instruction;
logic regWriteEnable, memWriteEnable, select;
logic [2:0] regwriteAddress, regreadAddress0, regreadAddress1;
logic [3:0] readData0, readData1, aluResult;
logic [3:0] memreadData, out;

instruction_memory imem(pc,instruction);
register_file regFile ( clk, reset, regWriteEnable, 
regwriteAddress, out,
 regreadAddress0, 
regreadAddress1, 
readData0, readData1);
alu alu (readData0, readData1,
 instruction[11:9],
 aluResult);
data_memory dmem(clk, reset, memWriteEnable,
 instruction[3:0], readData1,
 memreadData);
controller controller(instruction,
 memWriteEnable, regWriteEnable, select,
 regwriteAddress, regreadAddress0, regreadAddress1);
mux2to1 mux(aluResult, memreadData, select, out);

endmodule
