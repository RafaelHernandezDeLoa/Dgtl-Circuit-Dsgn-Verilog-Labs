`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2023 12:34:37 PM
// Design Name: 
// Module Name: simple_calc_BCD
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


module simple_calc_BCD(
    input [3:0] X, Y,
    input [1:0] op_sel,
    output [11:0] bcd,
    output negative, 
    output overflow,
    output carry_out
    );
   
wire [7:0] result, binary;    
    
    simple_calc S0(
        .x(X),
        .y(Y),
        .op_sel(op_sel),
        .result(result),
        .overflow(overflow),
        .carry_out(carry_out)
        
    );
   
    comparator C0(
        .Y(Y),
        .result(result),
        .op_sel(op_sel),
        .binary(binary),
        .negative(negative)         
    );


bin2bcd b0 (
    .bin(binary),
    .bcd(bcd)
);

    
   
endmodule
