`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 08:38:22 PM
// Design Name: 
// Module Name: 8-bit_2x1_multiplexer
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


module simple_8_bit_2x1_multiplexer(
    input [7:0] x, y,
    input s,
    output reg [7:0] M
    );
    
    always @(x, y, s)
    begin
        case(s)
        1: M = y;
        0: M = x;
        endcase
    end
    
    
endmodule
