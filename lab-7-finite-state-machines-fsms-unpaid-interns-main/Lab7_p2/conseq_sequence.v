`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2023 02:14:33 PM
// Design Name: 
// Module Name: conseq_sequence
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


module conseq_sequence(
    input clk,
    input x,
    input reset_n,
    output y
    );
    
    localparam s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6;
    
    reg [2:0] state_reg, state_next;
    
    //state register    
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;
    end
    
    //next state logic
    always @(*)
    begin
        case(state_reg)
            s0: if (x)
                    state_next = s1;
                else
                    state_next = s4;
            s1: if (x)
                    state_next = s2;
                else
                    state_next = s4;
            s2: if (x)
                    state_next = s3;
                else
                    state_next = s4;
            s3: if (x)
                    state_next = s3;
                else
                    state_next = s4;
            s4: if (x)
                    state_next = s1;
                else
                    state_next = s5;
            s5: if (x)
                    state_next = s1;
                else
                    state_next = s6;
            s6: if (x)
                    state_next = s1;
                else
                    state_next = s6;
        endcase
    end
    
    //output logic
    assign y = (state_reg == s6) || (state_reg == s3); //((state_reg == s5) && (~x)) || ((state_reg == s6) && (~x)) || ((state_reg == s2) && (x)) || ((state_reg == s3) && (x));
endmodule
