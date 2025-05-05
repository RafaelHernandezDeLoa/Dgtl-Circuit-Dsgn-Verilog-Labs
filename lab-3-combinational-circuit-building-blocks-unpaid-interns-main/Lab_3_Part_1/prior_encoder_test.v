`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2023 08:31:53 PM
// Design Name: 
// Module Name: prior_encoder_test
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


module prior_encoder_test(
    input [15:0] S,
    output DP,
    output [7:0] AN,
    output [6:0] sseg
    );
    
    wire z;
    wire [3:0] display;
    
    priority_encoder_generic #(.N(16)) PEC(
    .w(S),
    .y(display),
    .z(z)
    );
    
    hex2sseg H2S(
    .hex(display),
    .sseg(sseg)
    );
    
    assign DP = 1;
    assign AN = 8'b11111110;
    
    
    
endmodule
