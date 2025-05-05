`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 01:16:53 PM
// Design Name: 
// Module Name: csa_multiplier
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


module csa_multiplier(
    input [3:0] m, q,
    output [7:0] p
    );
    
    // row 1
    wire [3:0] mq0, mq1, mq2, mq3;
    
    mq_4bit MQ0 (.m(m), .q(q[0]), .mq(mq0));
    
    assign p[0] = mq0[0];
    
    mq_4bit MQ1 (.m(m), .q(q[1]), .mq(mq1));
    
    wire C00, C01, C02, C03;
    
    full_adder FA00 (.x(mq1[0]), .y(mq0[1]), .c_in(1'b0), .s(p[1]), .c_out(C00));
    
    mq_4bit MQ2 (.m(m), .q(q[2]), .mq(mq2));
    
    wire S01, S02, S03;
    
    full_adder FA01 (.x(mq0[2]), .y(mq1[1]), .c_in(mq2[0]), .s(S01), .c_out(C01));
    
    full_adder FA02 (.x(mq0[3]), .y(mq1[2]), .c_in(mq2[1]), .s(S02), .c_out(C02));
    
    full_adder FA03 (.x(1'b0), .y(mq1[3]), .c_in(mq2[2]), .s(S03), .c_out(C03));
    
    // row 2
    
    wire C10, C11, C12, C13;
    
    full_adder FA10 (.x(S01), .y(1'b0), .c_in(C00), .s(p[2]), .c_out(C10));
    
    mq_4bit MQ3 (.m(m), .q(q[3]), .mq(mq3));
    
    wire S11, S12, S13;
    
    full_adder FA11 (.x(S02), .y(mq3[0]), .c_in(C01), .s(S11), .c_out(C11));
    
    full_adder FA12 (.x(S03), .y(mq3[1]), .c_in(C02), .s(S12), .c_out(C12));
    
    full_adder FA13 (.x(mq2[3]), .y(mq3[2]), .c_in(C03), .s(S13), .c_out(C13));
    
    // row 3
    
    wire C20, C21, C22;
    
    full_adder FA20 (.x(S11), .y(C10), .c_in(1'b0), .s(p[3]), .c_out(C20));
    
    full_adder FA21 (.x(S12), .y(C11), .c_in(C20), .s(p[4]), .c_out(C21));
    
    full_adder FA22 (.x(S13), .y(C12), .c_in(C21), .s(p[5]), .c_out(C22));
    
    full_adder FA23 (.x(mq3[3]), .y(C13), .c_in(C22), .s(p[6]), .c_out(p[7])); //do part 6
    
    
    
    
endmodule
