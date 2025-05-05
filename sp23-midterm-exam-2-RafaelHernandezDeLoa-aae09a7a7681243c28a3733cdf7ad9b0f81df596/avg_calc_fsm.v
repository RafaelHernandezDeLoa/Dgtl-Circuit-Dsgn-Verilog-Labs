`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 12:49:29 PM
// Design Name: 
// Module Name: avg_calc_fsm
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


module avg_calc_fsm(
    input clk, reset_n,
    input calculate_average,
    output en,
    output rst_n,
    output ld
    );
    
    // TODO: Your FSM goes here
    localparam s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5;
    reg [2:0] state_reg, state_next;
    
    //State register
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;
    end
 
    //Next state logic
    always @(*)
    begin
        case(state_reg)
            s0: if (calculate_average)
                    state_next = s1;
                else
                    state_next = s0;
            s1: state_next = s2;
            s2: state_next = s3;
            s3: state_next = s4;
            s4: state_next = s5;
            s5: state_next = s0;
            default: state_next = state_reg;
        endcase
    end

    //Output logic
    assign en = (state_reg == s1) || (state_reg == s2) || (state_reg == s3) || (state_reg == s4);
    assign rst_n = (state_reg == s1) || (state_reg == s2) || (state_reg == s3) || (state_reg == s4) || (state_reg == s5);
    assign ld = (state_reg == s5);
endmodule
