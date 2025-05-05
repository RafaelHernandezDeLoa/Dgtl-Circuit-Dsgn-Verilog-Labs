`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2023 12:24:54 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file
    #(parameter N = 7, BITS = 4)(
    input clk,
    input [N - 1:0] address_w,
    input WE,
    input [BITS - 1:0] data_w,
    input [N - 1:0] address_r,
    output [BITS - 1:0] data_r
    );
    
    wire [2 ** N - 1:0] d0;
    
    decoder_generic #(.N(N)) DG0 (
        .w(address_w),
        .en(WE),
        .y(d0)
    );
    
    wire [2 ** N - 1:0] d1;
    
    decoder_generic #(.N(N)) DG1(
        .w(address_r),
        .en(1'b1),
        .y(d1)
    );
    
    wire [BITS - 1:0] Out [0:2 ** N - 1]; // bits size Out reg size
    
    generate
        genvar k;
        for (k = 0; k < 2 ** N; k = k + 1)
        begin: REG
            simple_register_load #(.N(BITS)) SRL (
                .clk(clk),
                .load(d0[k]),
                .I(data_w),
                .Q(Out[k])
            );
            
            assign data_r = d1[k] ? Out[k] : 4'bzzzz; //assign b = (enable) ? a : 1'bz;
        end
    endgenerate
    
endmodule
