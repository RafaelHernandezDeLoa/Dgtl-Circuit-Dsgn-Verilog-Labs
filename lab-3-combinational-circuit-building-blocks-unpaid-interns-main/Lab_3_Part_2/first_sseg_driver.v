`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2023 09:44:18 AM
// Design Name: 
// Module Name: first_sseg_driver
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


module first_sseg_driver(
    input [2:0] active_digit,
    input [3:0] num,
    input DP_ctrl,
    output [6:0] sseg,
    output [0:7] AN,
    output DP
    );
    
    wire [7:0] y;
    
    assign DP = DP_ctrl;
    
    decoder_generic #(.N(3))DG(
    .w(active_digit),
    .en(1),
    .y(y)
    );
    
    assign AN = ~y;
    
    hex2sseg H2S(
    .hex(num),
    .sseg(sseg)
    );
    
    
endmodule
