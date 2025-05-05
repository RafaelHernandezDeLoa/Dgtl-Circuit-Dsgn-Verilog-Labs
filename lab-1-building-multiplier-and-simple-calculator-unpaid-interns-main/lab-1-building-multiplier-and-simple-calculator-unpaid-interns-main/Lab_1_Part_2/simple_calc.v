`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 08:34:29 PM
// Design Name: 
// Module Name: simple_calc
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


module simple_calc(
    input [3:0] x, y,
    input [1:0] op_sel,
    output [7:0] result,
    output carry_out,
    output overflow
    );
    
    wire [3:0] s;
    
    adder_subtractor AS0 (
        .x(x),
        .y(y),
        .add_n(op_sel[0]),
        .s(s), 
        .c_out(carry_out),
        .overflow(overflow)
    );
    
    wire [7:0] p;
    
    csa_multiplier M0 (
        .m(x),
        .q(y),
        .p(p)
    );
    
    simple_8_bit_2x1_multiplexer SM0 (
        .x({4'b0, s}),
        .y(p),
        .s(op_sel[1]),
        .M(result)
    );
    
    
endmodule
