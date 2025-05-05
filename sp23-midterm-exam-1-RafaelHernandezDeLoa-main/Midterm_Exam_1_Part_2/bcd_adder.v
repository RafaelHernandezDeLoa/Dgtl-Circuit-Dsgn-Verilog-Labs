`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2023 12:13:23 PM
// Design Name: 
// Module Name: bcd_adder
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


module bcd_adder #(parameter n = 2)(
    input [n * 4 - 1:0] X, Y,
    output [n * 4 - 1:0] S,
    output c_out
    );
    
    wire [n:0] c;
    assign c[0] = 0;
    assign c_out = c[n];
    
    generate
        genvar k;
        for (k = 0; k < n; k = k + 1)
        begin
            bcd_adder_digit BAD(
            .x(X[(k + 1) * 4 - 1: k * 4]),
            .y(Y[(k + 1) * 4 - 1: k * 4]),
            .c_in(c[k]),
            .s(S[(k + 1) * 4 - 1: k * 4]),
            .c_out(c[k + 1])
            );
        end
    
    endgenerate
    
    
endmodule
