`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2023 11:38:40 AM
// Design Name: 
// Module Name: bcd_adder_digit
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


module bcd_adder_digit(
    input [3:0] x,
    input [3:0] y,
    input c_in,
    output [3:0] s,
    output c_out
    );
    
    wire [3:0] z;
    wire c0, c1;
    
    rca_nbit #(.n(4)) R4B (
    .x(x),
    .y(y),
    .c_in(c_in),
    .s(z),
    .c_out(c0)
    );
    
    assign c_out = (c0)|(z[3] & z[2])|(z[3] & z[1]);
    
    rca_nbit #(.n(2)) R2B (
    .x({c_out,c_out}),
    .y({z[2],z[1]}),
    .c_in(1'b0),
    .s(s[2:1]),
    .c_out(c1)
    );
    
    assign s[3] = z[3] ^ c1;
    assign s[0] = z[0];
    
endmodule
