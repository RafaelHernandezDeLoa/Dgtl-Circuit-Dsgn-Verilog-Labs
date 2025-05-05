`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 11:45:40 AM
// Design Name: 
// Module Name: first_sseg_driver_test
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


module first_sseg_driver_test(
    input [2:0] x,
    output [6:0] sseg,
    output [0:7] AN,
    output DP
    );
    
    first_sseg_driver FSD(
        .active_digit(x),
        .num({1'b0, x}),
        .DP_ctrl(1),
        .sseg(sseg),
        .AN(AN),
        .DP(DP)
    );
    
    
endmodule
