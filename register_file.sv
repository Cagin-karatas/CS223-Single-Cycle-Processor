`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2021 18:31:53
// Design Name: 
// Module Name: register_file
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


module register_file(
input logic clk, reset, writeEnable,
input logic [2:0] regwriteAddress,
input logic [3:0] regwriteData,
input logic [2:0] regreadAddress0,
input logic [2:0] regreadAddress1,
output logic [3:0] readData0, readData1
);
logic [3:0] memory [7:0];
always_ff @(posedge clk)
begin
readData0 <=  memory [regreadAddress0];
readData1 <=  memory [regreadAddress1];
if(reset)
begin
    begin
        for (int i = 0; i < 8; i++ )
            begin
            memory[i] = 4'b0000;
            end
    end
    if (writeEnable) 
         memory [regwriteAddress] <= regwriteData;
end
else
    if(writeEnable == 1)
    memory[regwriteAddress] <= regwriteData;
    
end

//assign readData0 = (regreadAddress0 != 0) ? memory [regreadAddress0] : 0;
//assign readData1 = (regreadAddress1 != 0) ? memory [regreadAddress1] : 0;

endmodule
