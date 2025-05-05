`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2023 12:43:59 PM
// Design Name: 
// Module Name: add_3
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


module add_3(
    input [3:0] A,
    output reg [3:0] S
    );
    
    
    
    always@(A)
    begin
        //default value for S
        S = 4'b0000;
    
        case(A)
            0: S = 4'b0000;
            1: S = 4'b0001;
            2: S = 4'b0010;
            3: S = 4'b0011;
            4: S = 4'b0100;
            5: S = 4'b1000;
            6: S = 4'b1001;
            7: S = 4'b1010;
            8: S = 4'b1011;
            9: S = 4'b1100;
            10: S = 4'bXXXX;
            11: S = 4'bXXXX;
            12: S = 4'bXXXX;
            13: S = 4'bXXXX;
            14: S = 4'bXXXX;
            15: S = 4'bXXXX;
            default: S = 4'bxxxx;     
        endcase   
    end   
endmodule
