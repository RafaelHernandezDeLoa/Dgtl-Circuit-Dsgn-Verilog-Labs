`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2023 12:58:44 PM
// Design Name: 
// Module Name: accumulator
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


module accumulator(
    input clk,
    input [3:0] X,
    input Add_Sub,
    input load,
    input reset_n,
    output [0:7] AN,
    output [6:0] sseg,
    output DP
    );
    
    wire out0;
    wire out1;
    wire [3:0] Q, Sum;
    reg [3:0] D;
    
    button B0 (
        .clk(clk),
        .in(load),
        .out(out0)
    ); 
    
    simple_register_load_with_reset SRL0 (
        .clk(clk),
        .load(out0),
        .reset_n(reset_n),
        .I(Sum),
        .Q(Q)
    );
    
    adder_subtractor AS(
        .x(Q),
        .y(X),
        .add_n(Add_Sub),
        .s(Sum),
        .c_out(),
        .overflow()
    );
    
    hex2sseg H2S(
        .hex(Q),
        .sseg(sseg)
    );
    
    assign AN = 8'b11111110;
    assign DP = 1;
    
endmodule
