`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2023 12:11:06 AM
// Design Name: 
// Module Name: morse_decoder_application
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


module morse_decoder_application(
    input clk,
    input reset_n,
    input noisy_b,
    output [0:7] AN,
    output [6:0] sseg,
    output DP
    );
    
    wire p_edge, n_edge;
    // button stuff:
    button btn_b(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy_b),
        .debounced(),
        .p_edge(p_edge),
        .n_edge(n_edge),
        ._edge()
    );
    
    wire done;
    // timer counter stuff:
    timer_parameter #(.FINAL_VALUE (9_999_999)) tmr (
        .clk(clk),
        .reset_n(~reset_fsm),
        .enable(en),
        .done(done)
    );
    
    wire [2:0] count;
    udl_counter #(.BITS(3)) counter0(
        .clk(clk),
        .reset_n(~reset_fsm),
        .enable(done),
        .up(1'b1), // 1 = count up, 0 = count down
        .load(1'b0), // load = 1 load value, 0 = do not load
        .D(), //value to be loaded
        .Q(count) //output
    );
    
    wire en;
    wire reset_fsm;
    morse_detector_fsm(
        .clk(clk),
        .reset_n(reset_n),
        .p_edge(p_edge),
        .n_edge(n_edge),
        .count(count),
        .en(en),
        .dot(dot),
        .dash(dash),
        .lg(lg),
        .wg(wg),
        .reset(reset_fsm)   
    );
    
    //shifr register stuff
    wire shift;
    assign shift = dot ^ dash; // ^ = xor in verilog
    wire [4:0] Q; // 5-bit Q
    // 5-bit shift register:
    shift_register #(.N(5)) SR (
        .clk(clk),
        .SI(dash), 
        .enable(shift),
        .Q(Q),
        .SO()
    );
    
    // if q is 5 then load 0
    reg load;
    reg [4:0] display_enable ;
    always@ (*)
    begin
        display_enable = 5'b000_00;
        load = 0;
        if (input_count == 1)
            display_enable[0] = 1;
        else if (input_count == 2)
        begin
            display_enable[0] = 1;
            display_enable[1] = 1;
        end    
        else if (input_count == 3)
        begin
            display_enable[0] = 1;
            display_enable[1] = 1;
            display_enable[2] = 1;
        end          
        else if (input_count == 4)
        begin
            display_enable[0] = 1;
            display_enable[1] = 1;
            display_enable[2] = 1;
            display_enable[3] = 1;
        end      
        else if (input_count == 5)
        begin
            display_enable = 5'b1_1111;
            load = 1;
        end    
        else
        begin
            load = 0; 
            display_enable = 5'b00000;
        end       
    end
    
    wire [2:0] input_count;
    //UDL counter
    udl_counter #(.BITS(3)) counter1(
        .clk(clk),
        .reset_n(reset_n),
        .enable(shift),
        .up(1'b1), // 1 = count up, 0 = count down
        .load(load), // load = 1 load value, 0 = do not load
        .D(3'd0), //value to be loaded
        .Q(input_count) //output
    );
    
    // 6-bit (enable, 4-bit number, dp enable)
    sseg_driver ssd(
        .clk(clk),
        .I0({display_enable[0], 3'b000, Q[0], 1'b0}),
        .I1({display_enable[1], 3'b000, Q[1], 1'b0}),
        .I2({display_enable[2], 3'b000, Q[2], 1'b0}),
        .I3({display_enable[3], 3'b000, Q[3], 1'b0}),
        .I4({display_enable[4], 3'b000, Q[4], 1'b0}),
        .I5({1'b0, 4'b0000, 1'b0}),
        .I6({1'b0, 4'b0000, 1'b0}),
        .I7({1'b1, 1'b0 ,input_count, 1'b0}),
        .reset_n(reset_n),
        .AN(AN),
        .sseg(sseg),
        .DP(DP)
    );
       
endmodule
