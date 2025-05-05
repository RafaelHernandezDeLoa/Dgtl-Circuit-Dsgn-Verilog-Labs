`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2023 11:26:14 PM
// Design Name: 
// Module Name: simple_calc_first_sseg
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


module simple_calc_first_sseg(
    input [3:0] x, y,
    input [1:0] op_sel, mux_select,
    input DP_ctrl,
    output carry_out, overflow,
    output [7:0] AN,
    output [6:0] sseg
    );
    
    wire [11:0] bcd;
    
    wire [3:0] num;
    
    simple_calc_BCD scalc0(
        .X(x),
        .Y(y),
        .op_sel(op_sel),
        .bcd(bcd),
        .negative(), //idk if this can be left blank
        .overflow(overflow),
        .carry_out(carry_out)
    );
    
    mux_4x1_nbit #(.N(4)) fourbitMux(
        .w0(bcd[11:8]),
        .w1(bcd[7:4]),
        .w2(bcd[3:0]),
        .w3(4'b0000),
        .s(mux_select),
        .f(num)
    );
    
    
    first_sseg_driver fsd0 (
        .active_digit( {1'b1, mux_select} ), //changed this line, was a 1'b0
        .num(num),
        .DP_ctrl(DP_ctrl),
        .sseg(sseg),
        .AN(AN)
    );
    
    
    
endmodule
