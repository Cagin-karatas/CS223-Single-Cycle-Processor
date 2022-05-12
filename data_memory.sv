`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2021 18:22:47
// Design Name: 
// Module Name: data_memory
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


module data_memory(
input logic clk, reset, writeEnable,
input logic [3:0] Address,
input logic [3:0] writeData,
output logic [3:0] readData
);
logic [3:0] memory [15:0];
   assign memory[0] = 4'b0101;
   assign memory[1] = 4'b0100;
   assign readData = memory[Address]; 

always_ff @(posedge clk)
begin
begin
if (writeEnable)
       memory[Address] <= writeData;
end
if(reset)
begin
    begin
        for (int i = 0; i < 16; i++ )
            begin
            memory[i] = 4'b0000;
            end
    end
 
end
end
endmodule
