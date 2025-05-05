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
    output DP,
    output tx
    );
    
    // button stuff:
    wire p_edge, n_edge;
    button btn_b(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy_b),
        .debounced(),
        .p_edge(p_edge),
        .n_edge(n_edge),
        ._edge()
    );
   
    wire re;
    button btn_re(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy_re),
        .debounced(),
        .p_edge(re),
        .n_edge(),
        ._edge()
    );
    
    //timer: 50 ms
    wire done;
    wire en;
    wire reset_fsm; //9_999_999 = OG Timer Value
    timer_parameter #(.FINAL_VALUE (4_999_999)) tmr (
        .clk(clk),
        .reset_n(~reset_fsm),
        .enable(en),
        .done(done)
    );
    //counter
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
    
    //fsm:
    wire lg, wg, dot, dash;
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
    
    //shift register stuff
    wire shift, reset_shift;
    assign shift = dot ^ dash; // ^ = xor in verilog
    assign reset_shift = lg | wg;
    wire [4:0] symbol; // 5-bit Q
    // 5-bit shift register:
    shift_register #(.N(5)) SR (
        .clk(clk),
        .SI(dash), 
        .enable(shift),
        .reset(reset_shift),
        .Q(symbol),
        .SO()
    );
    
    //symbol_counter
    reg load;
    wire [2:0] symbol_count;
    udl_counter #(.BITS(3)) symbol_counter(
        .clk(clk),
        .reset_n(~reset_shift),
        .enable(shift),
        .up(1'b1), // 1 = count up, 0 = count down
        .load(load), // load = 1 load value, 0 = do not load
        .D(3'd0), //value to be loaded
        .Q(symbol_count) //output
    );
    
    //DFF
    wire wg_delayed;
    D_FF_reset DFF(
        .clk(clk),
        .D(wg),
        .reset_n(reset_n),
        .clear_n(1'b1),
        .Q(wg_delayed)
    );
    
    //2to1 mux
    reg [7:0] addr;
    wire [7:0] data;
    always@(*)
    begin
        if (wg)
            addr = 8'b1110_0000; 
        else
            addr = {symbol_count, symbol};         
    end
    
    //synch ROM
    synch_rom srom(
        .clk(clk),
        .addr(addr),
        .data(data)
    );
    
    //UART Module
    // we are transmitting to the computer not receiving!
    wire full;
    wire wr_uart = ~full & (lg | wg | wg_delayed);
    uart UART (
        .clk(clk),
        .reset_n(reset_n),
        //receiver port
        .r_data(), //output
        .rd_uart(1'b0), //input (connect to 0)
        .rx_empty(), //output
        .rx(), //input
        
        //transmitter port
        .w_data(data), // input
        .wr_uart(wr_uart), //input
        .tx_full(full), //output
        .tx(tx), //output
        .TIMER_FINAL_VALUE(11'd650) // input  (650) 
    );
     
    //enables for the sseg
    //enables for morse code signals on sseg 0-4
    reg [4:0] display_enable;
    always@ (*)
    begin
        display_enable[4:0] = 5'b000_00;
        load = 0;
        if (symbol_count == 1)
            display_enable[0] = 1;
        else if (symbol_count == 2)
        begin
            display_enable[0] = 1;
            display_enable[1] = 1;
        end    
        else if (symbol_count == 3)
        begin
            display_enable[0] = 1;
            display_enable[1] = 1;
            display_enable[2] = 1;
        end          
        else if (symbol_count == 4)
        begin
            display_enable[0] = 1;
            display_enable[1] = 1;
            display_enable[2] = 1;
            display_enable[3] = 1;
        end      
        else if (symbol_count == 5)
        begin
            display_enable[4:0] = 5'b11_111;
            load = 1;
        end    
        else
        begin
            load = 0; 
            display_enable[4:0] = 5'b00_000;
        end
                  
    end
    
    // 6-bit (enable, 4-bit number, dp enable)
    sseg_driver ssd(
        .clk(clk),
        .I0({display_enable[0], 3'b000, symbol[0], 1'b1}),
        .I1({display_enable[1], 3'b000, symbol[1], 1'b1}),
        .I2({display_enable[2], 3'b000, symbol[2], 1'b1}),
        .I3({display_enable[3], 3'b000, symbol[3], 1'b1}),
        .I4({display_enable[4], 3'b000, symbol[4], 1'b1}),
        .I5({1'b0, 4'b0000, 1'b0}),
        .I6({1'b0, 4'b0000, 1'b0}),
        .I7({1'b0, 4'b0000, 1'b0}),
        .reset_n(reset_n),
        .AN(AN),
        .sseg(sseg),
        .DP(DP)
    );
    
    
endmodule
