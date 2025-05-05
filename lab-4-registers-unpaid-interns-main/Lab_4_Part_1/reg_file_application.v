`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2023 11:33:28 AM
// Design Name: 
// Module Name: reg_file_application
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


module reg_file_application(
    input clk,
    input [6:0] address, //generic address
    input SW, //demuxes to read and write address
    input in, //WE
    input [3:0] data_w,
    output [6:0] sseg,
    output [0:7] AN,
    output DP
    );
    
    wire out; //WE
    
    button B(
        .clk(clk),
        .in(in),
        .out(out)
    );
    
    reg [6:0] address_w, address_r;
        
    always @(SW, address)
    begin
        address_w = 7'b0000000;
        address_r = 7'b0000000;
        
        if (SW)
        begin
            address_r = address;
        end
        else
        begin
            address_w = address;
        end
    end
    
    wire [3:0] data_r;
    
    reg_file RF(
        .clk(clk),
        .address_w(address_w),
        .WE(out),
        .data_w(data_w),
        .address_r(address_r),
        .data_r(data_r)
    );
    
    hex2sseg HS (
        .hex(data_r),
        .sseg(sseg)
    );
    
    assign AN = 8'b11111110;
    assign DP = 1;
    
endmodule
