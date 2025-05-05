`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2023 01:33:16 PM
// Design Name: 
// Module Name: comparator
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


module comparator(
    input [3:0] Y,
    input [7:0] result,
    input [1:0] op_sel,
    output reg [7:0] binary,
    output reg negative
    );
 
always @(Y, op_sel, result)
begin    
    if ((result[3] == 1'b1 ) && ( op_sel == 2'b01)) // if the 4th bit of the result is 1
    begin
        binary[7:4] = result[7:4];     
        binary[3:0] = ~result[3:0] +4'b0001; //takes 2's comp  
        negative = 1'b1;    
    end
    else
    begin
        binary = result;
        negative = 1'b0;
    end  
end


    
endmodule
