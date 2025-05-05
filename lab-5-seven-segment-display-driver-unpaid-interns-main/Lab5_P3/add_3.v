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
    
    always @(A)
    begin
        if ((A >= 4'b0101) && (A <= 4'b1001))
            S = A + 4'b0011;
        else
            S = A;
        /*
        S[3:1] = S[2:0];
        S[0] = 0; */
    end
    
    
endmodule
