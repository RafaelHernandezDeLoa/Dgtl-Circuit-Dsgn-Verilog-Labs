## Midterm Exam 1 - Rafael Hernandez De Loa

#**Part 1:**
 For part 1, I was tasked to build an adder that deals with BCD binary numbers (with a carry-in). This adder had to produce a carry-out and the resulting BCD binary number answer. I created a module called "bcd_adder_digit" to accomplish this tasked. I instantiated two RCA module called "rca_nbit" from the source code provided to me by my professor (along with the full adder and half adder modules from the professor needed to make this module function). I used a combination of these RCA modules and a few operators to create the BCD adder in verilog.

#**Part 2:**
 For this part, I created a generic multi-digit BCD adder and tested it. I created a module called "bcd_adder" where I kept the code used to create this adder. I parameterized it to the number of BCD digits we want to add. I created a generate loop and added each corresponding digit from each of the two inputs and saved it to the output (while carrying the carry-outs to the next calculation). I have a block diagram below to illistrate what I did. I created a testbench to test the my module. The simulation of the testbench is shown below. I have also created a constraint file and ran the code on my FPGA.

![This is my block diagram](https://github.com/Spring-2023-Classes/sp23-midterm-exam-1-RafaelHernandezDeLoa/blob/main/Midterm_Exam_1_Part_2/Midterm_Exam_1_Part_2_Block_Diagram.png)
**Part 2 Block Diagram**

![This is my simulation](https://github.com/Spring-2023-Classes/sp23-midterm-exam-1-RafaelHernandezDeLoa/blob/main/Midterm_Exam_1_Part_2/Midterm_Exam_1_Part_2_Simulation.png)
**Part 2 Simulation**
