`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2023 12:32:39 PM
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
    
    //miscellaneous outputs that only matter for the adder/subtractor circuit!
    output overflow,
    output carry_out
    );
    
    wire [3:0] s;
    wire [7:0] p;
    
    adder_subtractor #(.n(4)) AS (
        .x(x),
        .y(y),
        .add_n(op_sel[0]), //no cin for the adder therefore, add_n is 1-bit value of 0!
        .s(s),
        .c_out(carry_out),
        .overflow(overflow)
    
    );    
    
    csa_multiplier M (
        .m(x),
        .q(y),
        .p(p)
    
    );
    
    simple_8_bit_2x1_MUX SM0(
        .x1( {4'b0, s}   ), //concatenation: this means s will have 4 zeroes before the output from the sum circuit
                            //EX: 0000 XXXX (where XXXX represents the output of the adder_subtractor module
        .x2(p),
        .s(op_sel[1]),
        .f(result)
    
    );
    
endmodule
