`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2023 04:18:33 PM
// Design Name: 
// Module Name: simple_calc_BCD_tb
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


module simple_calc_BCD_tb(

    );
    
    // 1. Declare local reg and wire identifiers
    //reg = inputs and outputs are wires generally
    
    reg [3:0] X, Y;
    reg [1:0] op_sel;
    wire [11:0] bcd;
    wire overflow, carry_out;
    wire negative;
    
    // 2. Instantiate the module under test
    simple_calc_BCD uut(
        .X(X),
        .Y(Y),
        .op_sel(op_sel),
        .bcd(bcd),
        .negative(negative),
        .overflow(overflow),
        .carry_out(carry_out)
    );
    
    // 3. Specify a stopwatch to stop the simulation
    initial //initial = like an always statement that always runs once!!
    begin
        #50 $finish; //after 40 nanoseconds finish the simulation
        //the timescale is at the top of the code 
    end
    
    
    // 4. Generate stimuli, using initial and always
    //test vector generation
    //needs to be either in an always statement or an initial
    
    initial
    begin
        //testing all operations
        X = 4'b0011; //3 in decimal
        Y = 4'b0100; //4 in decimal
        op_sel = 2'b00; //addition
        
        #10 //wait for 10 nanoseconds
        
        op_sel = 2'b01; //subtraction
        
        #10 //wait for 10 nanoseconds
        
        op_sel = 2'b11; //Multiplication
        
        #10 //wait for 10 nanoseconds  
        
        //testing carry_out!
        X = 4'b1111;
        Y = 4'b1111;
        op_sel = 2'b00; //addition
        
        #10
        
        //testing Overflow
        X = 4'b1010; //-6 in 2's comp
        Y = 4'b1101; //-3 in 2's comp
        op_sel = 2'b00; //addition
        
        #10; 
        
    end
    
endmodule
