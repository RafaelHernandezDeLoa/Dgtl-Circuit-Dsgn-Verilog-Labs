`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2023 01:05:01 PM
// Design Name: 
// Module Name: bcd_adder_tb
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


module bcd_adder_tb(

    );
    
    parameter n = 4;
    reg [n * 4 - 1:0] X, Y;
    wire [n * 4 - 1:0] S;
    wire c_out;
    
    bcd_adder #(.n(n)) BA (
        .X(X),
        .Y(Y),
        .S(S),
        .c_out(c_out)
    );
    
    initial
    begin
        #50 $finish;
    end
    
    initial
    begin
        X = 16'b0001_0001_0001_0001;
        Y = 16'b0001_0001_0001_0001;
        
        #10
        X = 16'b0100_0011_0101_0101;
        Y = 16'b0010_0101_0000_1001;
        
        #10
        X = 16'b0000_0100_0011_0100;
        Y = 16'b1000_1000_1000_0101;
        
        #10
        X = 16'b0010_0010_0101_0000;
        Y = 16'b0100_0000_0110_0111;
        
        #10
        X = 16'b1000_0101_0111_0011;
        Y = 16'b0110_0110_0011_0110;
        
        #10;
    end
    
endmodule
