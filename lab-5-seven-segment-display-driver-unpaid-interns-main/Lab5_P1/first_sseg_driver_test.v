`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2023 07:56:52 PM
// Design Name: 
// Module Name: first_sseg_driver_test
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


module first_sseg_driver_test(
    //input [2:0] X,
    input clk,
    input reset_n,
    output [6:0] sseg,
    output [0:7] AN, //Bits of AN declared in reverse order because that is how the decoder is
    output DP
    );
    
    //new stuff:
    wire enable; 
    wire [2:0] X;
    
    
    //assign DP_ctrl = 1'b1; //turns the DP off!
    
    wire [3:0] w1;
    assign w1 = {1'b0, X}; //wire w1 is 4 bits and equal to MSB of 0 then whatever the 3 bit input x is
    //this is necessary because the input of the hex2sseg module is 4 bits long
    
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
        .D(4'b0000), // continues counting from the loaded counter
        .Q(X) //output of the counter   
    );
    
    
    first_sseg_driver fsd0(
        .active_digit(X),           // active_digit will determine which display will be active!
        .num(w1),                   // binary number to be displayed
        .DP_ctrl(1'b1),             // to keep DP LED off
        .sseg(sseg),                // binary value to be displayed on the sseg
        .AN(AN),                    // controls whether or not the SSEG Displays are active. (0 = on, and 1 = off)
                                    // Bits of AN declared in reverse order because that is how the decoder is
        .DP(DP)                     // output that displays the LED or turns it off
    );
    
   
    
endmodule
