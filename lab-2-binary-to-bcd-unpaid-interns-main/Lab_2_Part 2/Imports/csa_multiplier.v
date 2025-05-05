`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 01:19:35 PM
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
    
    wire [3:0] mq0, mq1, mq2, mq3; 
    wire s01, s02, s03; //sums of row 1
    wire s11, s12, s13; //sums of row 2
    wire c00, c01, c02, c03; //row 1 cout
    wire c10, c11, c12, c13; //row 2 cout
    wire c20, c21, c22; //row 3 
    
    assign p[0] = mq0[0];
    
    mq_4bit mq0_4bit (
        .m(m),
        .q(q[0]),
        .mq(mq0)      
    );
    
    
    
    mq_4bit mq1_4bit (
        .m(m),
        .q(q[1]),
        .mq(mq1)      
    );
    
    mq_4bit mq2_4bit (
        .m(m),
        .q(q[2]),
        .mq(mq2)      
    );
    
    mq_4bit mq3_4bit (
        .m(m),
        .q(q[3]),
        .mq(mq3)      
    );
    
    
    
    //row 1 of full adders
    full_adder FA00 (
        .x(mq1[0]),
        .y(mq0[1]),
        .c_in(1'b0),
        .s(p[1]),
        .c_out(c00)  
    );
    
    full_adder FA01 (
        .x(mq0[2]),
        .y(mq1[1]),
        .c_in(mq2[0]),
        .s(s01),
        .c_out(c01)  
    );
    
    full_adder FA02 (
        .x(mq0[3]),
        .y(mq1[2]),
        .c_in(mq2[1]),
        .s(s02),
        .c_out(c02)  
    );
    
    full_adder FA03 (
        .x(1'b0),
        .y(mq1[3]),
        .c_in(mq2[2]),
        .s(s03),
        .c_out(c03)  
    );
    
    //row 2 of Full Adders
    
    full_adder FA10 (
        .x(s01),
        .y(1'b0),
        .c_in(c00),
        .s(p[2]),
        .c_out(c10)  
    );
    
    full_adder FA11 (
        .x(s02),
        .y(mq3[0]),
        .c_in(c01),
        .s(s11),
        .c_out(c11)  
    );
    
    full_adder FA12 (
        .x(s03),
        .y(mq3[1]),
        .c_in(c02),
        .s(s12),
        .c_out(c12)  
    );
    
    full_adder FA13 (
        .x(mq2[3]),
        .y(mq3[2]),
        .c_in(c03),
        .s(s13),
        .c_out(c13)  
    );
    
    //ROW 3: FA
    
    full_adder FA20 (
        .x(s11),
        .y(c10),
        .c_in(1'b0),
        .s(p[3]),
        .c_out(c20)  
    );
    
    full_adder FA21 (
        .x(s12),
        .y(c11),
        .c_in(c20),
        .s(p[4]),
        .c_out(c21)  
    );
    
    full_adder FA22 (
        .x(s13),
        .y(c12),
        .c_in(c21),
        .s(p[5]),
        .c_out(c22)  
    );
    
    full_adder FA23 (
        .x(mq3[3]),
        .y(c13),
        .c_in(c22),
        .s(p[6]),
        .c_out(p[7])  
    );
    
    
endmodule
