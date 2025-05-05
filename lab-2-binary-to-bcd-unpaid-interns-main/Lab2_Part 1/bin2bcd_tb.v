`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2023 02:00:54 PM
// Design Name: 
// Module Name: bin2bcd_tb
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


module bin2bcd_tb(
    
    );
    
    //1. Declare local reg and wire identifiers
    //registers = inputs and wires = outputs
    
    reg [7:0] bin;
    wire [11:0] bcd;
    
    //2. Instantiate the module under test
    bin2bcd uut( //uut = unit under test
        .bin(bin),
        .bcd(bcd)    
    );
    
    //3. Specify a stopwatch to stop the simulation
    initial
    begin
        #50 $finish; //establishes 50 ns to workwith
    end
    
    //4. Generate stimuli, using initial and always
    initial
    begin
        //case 0:
        bin = 8'b0100_0101; //69 in decimal
        #10 //wait 10 ns
        
        //case 1: 
        bin = 8'b1111_1111; //255 in decimal
        #10
        
        //case 2:
        bin = 8'b0110_0100; //100 in decimal
        #10
        
        //case 3:
        bin = 8'b0100_1110; //78 in decimal
       
      
        #10; //semicolon for the last 10 
        
    end
    
endmodule
