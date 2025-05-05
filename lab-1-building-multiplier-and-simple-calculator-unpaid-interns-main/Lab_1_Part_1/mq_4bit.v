`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 12:48:44 PM
// Design Name: 
// Module Name: mq_4bit
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


module mq_4bit(
    input [3:0] m,
    input q,
    output [3:0] mq
    );
    
    assign mq = m & {4{q}};
    
endmodule
