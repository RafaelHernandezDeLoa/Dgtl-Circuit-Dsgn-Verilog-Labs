`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 02:08:03 PM
// Design Name: 
// Module Name: morse_detector_fsm
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


module morse_detector_fsm(
    input clk,
    input reset_n,
    input p_edge,
    input n_edge,
    input [2:0] count,
    output en,
    output dot,
    output dash,
    output lg,
    output wg,
    output reset
    );
    
    reg [2:0] state_reg, state_next;
    localparam idle = 0;
    localparam pressed = 1;
    localparam s_dash = 2;
    localparam  mid = 3;
    localparam s_dot = 4;
    localparam  s_wait = 5;
    localparam s_lg = 6;
    localparam s_wg = 7;
    
    // State register
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            state_reg <= idle;
        else
            state_reg <= state_next;
    end 
    
    always @(*)
    begin
        case(state_reg)
            idle: if(p_edge)
                    state_next = pressed;
                  else
                    state_next = idle;
            pressed: if (n_edge && (count >= 0 && count <= 2))
                        state_next = s_dot;
                     else if(n_edge && (count >= 3 && count <= 6))
                        state_next = s_dash;
                     else if (count == 7)
                        state_next = idle;
                     else
                        state_next = pressed;   
            s_dash: state_next = s_wait;
            mid: state_next = pressed;
            s_dot: state_next = s_wait;
            s_wait: if (p_edge  && (count >= 0 && count <=2))//was 1
                    state_next = mid;
                  else if (p_edge && (count >=3 && count <= 6))
                    state_next = s_lg;  
                  else if (count ==7)
                    state_next = s_wg;
                  else
                    state_next = s_wait;    
            s_lg: state_next = pressed;
            s_wg: state_next = idle;                                                             
            default: state_next = state_reg;            
        endcase
    end

    //Output logic
    assign reset = (state_reg == idle) || (state_reg == s_dash) || (state_reg == mid) || (state_reg == s_dot) || (state_reg == s_lg) || (state_reg == s_wg);
    assign en = (state_reg == pressed) || (state_reg == s_wait);
    assign dash = (state_reg == s_dash);
    assign dot = (state_reg == s_dot);
    assign lg = (state_reg == s_lg);
    assign wg = (state_reg == s_wg);
    
endmodule
