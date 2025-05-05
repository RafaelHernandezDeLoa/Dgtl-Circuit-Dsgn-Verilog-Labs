`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 09:46:27 PM
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
    input clk,
    input reset_n,
    input noisy_c5, noisy_c10, noisy_c25,
    input noisy_item_taken,
    output r5, r10, r20,
    output red_LED, green_LED, blue_LED,
    output [0:7] AN,
    output [6:0] sseg,
    output DP
    );
    
    wire c5, c10, c25, item_taken;
    //button stuff:
    button btn_c5 (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy_c5),
        .debounced(),
        .p_edge(c5),
        .n_edge(),
        ._edge()    
    );
    
    button btn_c10 (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy_c10),
        .debounced(),
        .p_edge(c10),
        .n_edge(),
        ._edge()    
    );
    
    button btn_c25 (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy_c25),
        .debounced(),
        .p_edge(c25),
        .n_edge(),
        ._edge()    
    );
    
    
    button btn_itmtkn (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy_item_taken),
        .debounced(),
        .p_edge(item_taken),
        .n_edge(),
        ._edge()    
    );
    
    wire [5:0] money_inserted;
    wire dispense;
    //FSM for vending Machine
    vending_machine_controller vm_fsm(
        .clk(clk),
        .reset_n(reset_n),
        .c5(c5),
        .c10(c10),
        .c25(c25),
        .item_taken(item_taken),
        .dispense(dispense),
        .r5(r5),
        .r10(r10),
        .r20(r20),
        .state(money_inserted) 
    );
    
    reg [8:0] red_duty, green_duty;
    wire [8:0] blue_duty;
    assign blue_duty = 9'b0_0000_0000;
    //DISPENSE VS ITEM TAKEN
    //RGB logic for item_taken
    always@(*)
    begin
        red_duty = 9'b0_0000_0000;
        green_duty = 9'b0_0000_0000;
        if (dispense)
        begin
            green_duty = 9'b1_0000_0000;
            red_duty = 9'b0_0000_0000;
        end
        else
        begin
           red_duty = 9'b1_0000_0000;
            green_duty = 9'b0_0000_0000; 
        end
                 
    end
    
    wire [11:0] bcd_money;
    bin2bcd b2b0 (
        .bin({2'b00, money_inserted}), //6bits
        .bcd(bcd_money)
    );
    
    reg [5:0] change;
    wire [11:0] bcd_change;
    
    
    always@(*)
    begin
        if (dispense)
        begin
            change = {2'b00, money_inserted} - 8'b0001_1001; //25 in binary 0001 1001
        end
        
        else
        begin
            change = 8'b0000_0000;
        end
    end
    
    bin2bcd b2b1 (
        .bin({2'b00, change}),
        .bcd(bcd_change)
    );
    
    rgb_driver rgb0 (
        .clk(clk),
        .reset_n(reset_n),
        .red_duty(red_duty),
        .green_duty(green_duty),
        .blue_duty(blue_duty),
        .red_LED(red_LED),
        .green_LED(green_LED),
        .blue_LED(blue_LED)
    );
    
 
   // 6th bit is enable, 0 bit is DP
    //sseg Driver
    sseg_driver SSD(
        .clk(clk),
        .I0({1'b1,bcd_money[3:0] ,1'b1}),
        .I1({1'b1,bcd_money[7:4] ,1'b1}),
        .I2({1'b1, 4'b0000 ,1'b1}),
        .I3({1'b0, 4'b0000, 1'b1}),
        .I4({1'b0, 4'b0000, 1'b1}),
        .I5({1'b1,bcd_change[3:0] ,1'b1}),
        .I6({1'b1,bcd_change[7:4] ,1'b1}),
        .I7({1'b1,bcd_change[11:8] ,1'b1}),
        .reset_n(reset_n),
        .AN(AN),
        .sseg(sseg),
        .DP(DP)
        
    );        
    
    
    
    
    
endmodule
