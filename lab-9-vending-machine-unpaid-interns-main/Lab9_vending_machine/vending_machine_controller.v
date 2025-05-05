`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2023 11:42:31 PM
// Design Name: 
// Module Name: vending_machine_controller
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


module vending_machine_controller(
    input clk,
    input reset_n,
    input c5,
    input c10,
    input c25,
    input item_taken,
    output dispense,
    output r5,
    output r10,
    output r20,
    output [5:0] state
    );
    
    reg [5:0] state_reg, state_next;
    localparam s0 = 0;
    localparam s5 = 5;
    localparam s10 = 10;
    localparam s15 = 15;
    localparam s20 = 20;
    localparam s25 = 25;
    localparam s30 = 30;
    localparam s35 = 35;
    localparam s40 = 40;
    localparam s45 = 45;
    // State register
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;
    end 
    
    always @(*)
    begin
        case(state_reg)
            s0: if (c5)
                    state_next = s5;
                else if (c10)
                    state_next = s10;   
                else if(c25)
                    state_next = s25;
                else
                    state_next = s0;
              s5: if (c5)
                    state_next = s10;
                  else if (c10)
                    state_next = s15;
                  else if (c25)
                    state_next = s30;  
                  else
                    state_next = s5;
             s10: if (c5)
                    state_next = s15;
                  else if (c10)
                    state_next = s20;
                  else if (c25)
                    state_next = s35;  
                  else
                    state_next = s10;
             s15: if (c5)
                    state_next = s20;
                  else if (c10)
                    state_next = s25;
                  else if (c25)
                    state_next = s40;  
                  else
                    state_next = s15; 
             s20: if (c5)
                    state_next = s25;
                  else if (c10)
                    state_next = s30;
                  else if (c25)
                    state_next = s45;  
                  else
                    state_next = s20;
             s25: if (item_taken)
                    state_next = s0;
                  else
                    state_next = s25;
             s30: if (item_taken)
                    state_next = s0;
                  else
                    state_next = s30;
             s35: if (item_taken)
                    state_next = s0;
                  else
                    state_next = s35; 
             s40: if (item_taken)
                    state_next = s0;
                  else
                    state_next = s40;
             s45: if (item_taken)
                    state_next = s0;
                  else
                    state_next = s45;                                                              
            default: state_next = state_reg;            
        endcase
    end
    
    // Output logic
    assign dispense = ( (state_reg == s25) || (state_reg == s30) || (state_reg == s35) || (state_reg == s40) || (state_reg == s45) );
    assign r5 = ( (state_reg ==s30) || (state_reg == s40) );
    assign r10 = ( (state_reg == s35) || (state_reg == s40));
    assign r20 = (state_reg == s45); 
    
    assign state = state_reg;
    // don't forget to assign the value for 'state', the value to display current amount inserted
endmodule
