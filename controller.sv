`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2021 20:25:14
// Design Name: 
// Module Name: controller
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


module controller(
input logic [11:0] instruction,
output logic writeDataEn, writeRegisterEn, select,
output logic [2:0] writeRegAdress, readRegAdress0, readRegAdress1
);

always_comb

    case(instruction[11:9])
    3'b000:
    begin
    writeDataEn = 0;
    writeRegisterEn = 1;
    writeRegAdress = instruction[6:4];
    readRegAdress0 = instruction[3:0];
    
    select = 1;
    end
    3'b001:
    begin
    writeDataEn = 1;
    writeRegisterEn = 0;
    readRegAdress1 = instruction[6:4];
    select = 1;
    end
    3'b010:
    begin
    writeDataEn = 0;
    writeRegAdress = instruction[8:6];
    readRegAdress0 = instruction[5:3];
    readRegAdress1 = instruction[2:0];
    writeRegisterEn = 1;
    select = 0;
    end
    3'b011:
    begin
    writeDataEn = 0;
    writeRegAdress = instruction[8:6];
    readRegAdress0 = instruction[5:3];
    readRegAdress1 = instruction[2:0];
    writeRegisterEn = 1;
    select = 0;
    end
    3'b100:
    begin
    writeDataEn = 0;
    writeRegAdress = instruction[8:6];
    readRegAdress0 = instruction[5:3];
    readRegAdress1 = instruction[2:0];
    writeRegisterEn = 1;
    select = 0;
    end
    3'b110:
    begin
    writeDataEn = 0;
    writeRegAdress = instruction[8:6];
    readRegAdress0 = instruction[5:3];
    readRegAdress1 = instruction[2:0];
    writeRegisterEn = 1;
    select = 0;
    end
    3'b110:
    begin
    writeDataEn = 0;
    writeRegisterEn = 0; 
    select = 0;
    end
    default:
    begin
    writeDataEn = 0;
    writeRegisterEn = 0;
    select = 0;
    end
    endcase
endmodule
