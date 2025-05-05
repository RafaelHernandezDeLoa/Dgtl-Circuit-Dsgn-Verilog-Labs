`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 12:03:50 PM
// Design Name: 
// Module Name: conseq_sequence_tb
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


module conseq_sequence_tb(

    );
    
    reg clk, x, reset_n;
    wire y;
    
    conseq_sequence uut (
        .clk(clk),
        .x(x),
        .reset_n(reset_n),
        .y(y)
    );
    
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T/2);
        clk = 1'b1;
        #(T/2);
    end
    
    initial
    begin
        reset_n = 1'b0;
        x = 1'b0;
        @(negedge clk)
        reset_n = 1'b1;
        
        #T x = 1'b0;
        #T x = 1'b1;
        #T x = 1'b0;
        #T x = 1'b1;
        #T x = 1'b0;
        #T x = 1'b1;
        #T x = 1'b1;
        #T x = 1'b0;
        #T x = 1'b0;
        #T x = 1'b1;
        #T x = 1'b1;
        #T x = 1'b1;
        #T x = 1'b0;
        #T x = 1'b0;
        #T x = 1'b0;
        #T x = 1'b1;
        #T x = 1'b1;
        #T x = 1'b1;
        #T x = 1'b1;
        #T x = 1'b0;
        #T x = 1'b0;
        #T x = 1'b0;
        #T x = 1'b0;
        #T $finish;
    end
    
endmodule
