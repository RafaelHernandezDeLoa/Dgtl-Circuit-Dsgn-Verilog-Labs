`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2023 01:29:04 PM
// Design Name: 
// Module Name: bin2bcd
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


module bin2bcd(
    input [7:0] bin,
    output [11:0] bcd
    );
    
    wire [3:0] S0, S1, S2, S3, S5;
    
    assign bcd[0] = bin[0];
    assign bcd[11:10] = 2'b00; 
    
    add_3 A0(
        .A({1'b0, bin[7:5]}),
        .S(S0)
    );
    
    add_3 A1(
        .A({S0[2:0], bin[4]}),
        .S(S1)
    );
    
    add_3 A2(
        .A({S1[2:0], bin[3]}),
        .S(S2)
    );
    
    add_3 A3(
        .A({S2[2:0], bin[2]}),
        .S(S3)
    );
    
    add_3 A4(
        .A({S3[2:0], bin[1]}),
        .S(bcd[4:1])
    );
    
    add_3 A5(
        .A({1'b0, S0[3], S1[3], S2[3]}),
        .S(S5)
    );
    
    add_3 A6(
        .A({S5[2:0], S3[3]}),
        .S(bcd[8:5])
    );
    
    assign bcd[9] = S5[3];
    
endmodule
