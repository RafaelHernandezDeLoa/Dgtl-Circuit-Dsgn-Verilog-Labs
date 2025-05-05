`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2023 12:18:56 PM
// Design Name: 
// Module Name: counter_application
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


module counter_application(
        input clk,
        input up,
        input down,
        input load_m,
        input [7:0] load,
        input reset_n,
        output [0:7] AN,
        output [6:0] sseg,
        output DP
        );
    
    //buttons
    wire u, d, l_m;
    
    button B_U (
        .clk(clk),
        .in(up),
        .out(u)
    );
    
    button B_D (
        .clk(clk),
        .in(down),
        .out(d)
    );
    
    button B_L (
        .clk(clk),
        .in(load_m),
        .out(l_m)
    );
    
    reg direction, enable;
    
    always @(*)
    begin
        if (u & ~d)
        begin
            direction = 1'b1;
            enable = 1'b1;
        end
        else if (d & ~u)
        begin
            direction = 1'b0;
            enable = 1'b1;
        end
        else if (l_m)
        begin
            direction = 1'b0;
            enable = 1'b1;
        end
        else
        begin
            direction = 1'b0;
            enable = 1'b0;
        end
    end
    
    wire [7:0] Q;
    
    udl_counter #(.BITS(8)) UC (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .up(direction),
        .load(l_m),
        .D(load),
        .Q(Q)
    );
    
    wire [11:0] bcd;
    
    bin2bcd B2D (
        .bin(Q),
        .bcd(bcd)
    );
    
    
    sseg_driver SD(
        .clk(clk),
        .I0({1'b1, bcd[3:0], 1'b1}),
        .I1({1'b1, bcd[7:4], 1'b1}),
        .I2({1'b1, bcd[11:8], 1'b1}),
        .I3({1'b0, 4'b0000, 1'b1}),
        .I4({1'b0, 4'b0000, 1'b1}),
        .I5({1'b0, 4'b0000, 1'b1}),
        .I6({1'b0, 4'b0000, 1'b1}),
        .I7({1'b0, 4'b0000, 1'b1}),
        .reset_n(reset_n),
        .AN(AN),
        .sseg(sseg),
        .DP(DP)
    );
    
    
endmodule
