`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2023 06:32:06 PM
// Design Name: 
// Module Name: first_sseg_driver
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


module first_sseg_driver(
    input [2:0] active_digit,   //active_digit will determine which display will be active!
    input [3:0] num,    // binary number to be displayed
    input DP_ctrl,  //input that controls whether or not a decimal point is displayed (0 = on, and 1 = off)
    output [6:0] sseg,  //binary value to be displayed on the sseg
    output [0:7] AN, // controls whether or not the SSEG Displays are active. (0 = on, and 1 = off)
    //Bits of AN declared in reverse order because that is how the decoder is
    output DP   //output that displays the LED or turns it off
    );
    
    wire [0:7] w1; //bits are declared backwards because that is how the decoder is
    
    decoder_generic #(.N(3)) dg0(
        .w(active_digit), //w = input of the decoder
        .en(1'b1), //en = enable
        .y(w1) //y = output of the decoder
    );
    
    //inverts the output of the decoder since the AN's work backwards
    // 0 = on, and 1 = off
    assign AN = ~w1; 
    
    hex2sseg h2s0 (
        .hex(num), //input hex humber to be displayes
        .sseg(sseg) //sseg display output 
    );
    
    assign DP = DP_ctrl;
    
endmodule
