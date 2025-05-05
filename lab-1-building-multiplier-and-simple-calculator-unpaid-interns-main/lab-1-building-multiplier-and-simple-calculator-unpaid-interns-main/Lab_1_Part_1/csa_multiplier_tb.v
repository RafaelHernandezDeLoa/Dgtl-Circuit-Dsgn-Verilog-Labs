`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 03:39:49 PM
// Design Name: 
// Module Name: csa_multiplier_tb
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


module csa_multiplier_tb(
    
    );
    
    parameter n = 4; // consider taking out the parameter
    reg [3:0] m, q;
    wire [7:0] p;
    
    csa_multiplier uut (
        .m(m),
        .q(q),
        .p(p)
    );
    
    initial
    begin
        #50 $finish;
    end
    
    initial
    begin
        m = 1'b0;
        q = 4'b1010;
        
        #10
        m = 4'b0101;
        q = 4'b0101;
        
        #10
        m = 4'b1001;
        
        #10
        m = 4'b1100;
        q = 4'b1101;
        
        #10
        m = 4'b1111;
        q = 4'b1010;
    end
    
    initial
    begin
        $monitor("time = %3d: m = %d \t q = %d \t p = %3b",
        $time, m, q, p);
    end
    
endmodule
