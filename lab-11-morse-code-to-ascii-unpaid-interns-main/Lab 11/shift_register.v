`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 08:58:28 PM
// Design Name: 
// Module Name: shift_register
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


module shift_register
    #(parameter N = 4)(
        input clk,
        input  SI,
        input enable,
        input reset, // new reset signal
        output [N - 1:0] Q, //If we care about the content
        output SO        
    );
    
    reg [N - 1:0] Q_reg, Q_next;
    
    always @(posedge clk)
    begin
        if (reset) 
        begin
            Q_reg <= {N{1'b0}};
        end 
        else if (enable) begin
            Q_reg <= Q_next;
        end
    end
    
    // Next state logic
    
    always @(Q_reg, SI)
    begin
        // Right shift
        //Q_next = {SI, Q_reg[N - 1: 1]};
        
        // Left shift
        Q_next = {Q_reg[N - 2:0], SI};
    end
    
    // output logic
    // SO for a left shift
    assign SO = Q_reg[N-1];
    assign Q = Q_reg;
    
endmodule
