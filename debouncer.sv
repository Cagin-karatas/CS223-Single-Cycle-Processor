`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2021 18:38:28
// Design Name: 
// Module Name: debouncer
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


module debouncer(
input logic clk,
input logic button,
output logic pulse
);
logic [24:0] timer;
typedef enum logic [1:0]{s0,s1,s2,s3} states;
states state, nextState;
logic getInput;

always_ff@(posedge clk)
    begin
    state <= nextState;
    if(getInput)
        timer <= 25000000;
    else
        timer <= timer -1 ;    
    end
    
always_comb
    case(state)
    s0: if(button)
    begin
    nextState = s1;
    getInput = 1;
    end
    else
    begin
    nextState = s0;
    getInput = 0;
    end
    s1: 
    begin
    nextState = s2;
    getInput = 0;
    end
    s2: 
    begin 
    nextState = s3;
    getInput = 0;
    end
    s3: 
    begin if(timer == 0)
    nextState = s0;
    else
    nextState = s3;
    getInput = 0;
    end
    default: 
    begin
    nextState = s0;
    getInput = 0;
    end 
    endcase
    
    assign pulse = (state ==1);       
        

endmodule