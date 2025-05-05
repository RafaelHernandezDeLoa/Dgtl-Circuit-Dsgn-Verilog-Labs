`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2023 12:11:45 PM
// Design Name: 
// Module Name: sseg_driver
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


module sseg_driver(
    input clk,
    input [5:0] I0, I1, I2, I3, I4, I5, I6, I7,
    
    input reset_n, // think I need this input
    
    output [0:7] AN,
    output [6:0] sseg,
    output DP
    );
    
    
    //Part 1: 
        //new stuff:
    wire enable; 
    wire [2:0] X;
    
    //timer!!!
    timer_parameter #(.FINAL_VALUE(200000))CP0 (
        .clk(clk),
        .reset_n(reset_n),
        .enable(1'b1),
        .done(enable)
    );
    
    
    //counter: (3-bits = 0-7 count)
    udl_counter #(.BITS(3)) UDL0(
        .clk(clk),
        .reset_n(reset_n), //reset is active low, 0 = 0n, 1 = off
        .enable(enable),
        .up(1'b1), // when asserted the counter counts up; otherwise it is a down counter
        .load(1'b0),
        .D('b0), // continues counting from the loaded counter
        .Q(X) //output of the counter   
    );
    
    
    //Multiplexer- 6 bits by default
    wire [5:0] D_out;
    mux_8x1_nbit #(.N(6))M8x1N (
        .w0(I0),
        .w1(I1),
        .w2(I2),
        .w3(I3),
        .w4(I4),
        .w5(I5),
        .w6(I6),
        .w7(I7),
        .s(X), //select
        .f(D_out)
    );
    
    wire [0:7] w1; //bits are declared backwards because that is how the decoder is
    //Decoder:
    decoder_generic #(.N(3)) DG0 (
        .w(X), //input
        .en(D_out[5]),
        .y(w1) //output
    );
    
    assign AN = ~w1; //inverts the output of the decoder since the AN's work backwards
    // 0 = on, and 1 = off
    //will this work?
    
    // Hex to SSEG:
    hex2sseg (
        .hex(D_out[4:1]),
        .sseg(sseg)
    );
    
    
   assign DP = D_out[0];
    
    
endmodule
