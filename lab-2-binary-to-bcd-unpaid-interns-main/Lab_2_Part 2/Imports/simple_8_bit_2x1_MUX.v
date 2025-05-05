`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2023 12:28:53 PM
// Design Name: 
// Module Name: simple_8_bit_2x1_MUX
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


module simple_8_bit_2x1_MUX(
    input [7:0] x1, x2,
    input s,
    output reg [7:0] f
    
    );
    
   always @(x1, x2, s)
    begin
        case(s)
        1: f = x2;
        0: f = x1;
        endcase
    end
    
endmodule
