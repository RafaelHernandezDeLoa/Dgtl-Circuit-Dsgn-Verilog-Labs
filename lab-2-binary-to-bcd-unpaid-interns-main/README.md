# Lab 2 - Binary to BCD 
## Unpaid Interns: Carlos Zarco and Rafael Hernandez
### Due: 2/15/2023

<ins>Part 1:</ins>
For this part of the lab we created an 8-bit binary to 12-bit BCD converter. First, we made a module called add_3 which will add 3 to the input if the input is over 5. If it is below 5 it will output the input. If the input is above 9 it will output 4'bXXXX. Through instantiation, we converted the add_3 module into a largetr module called binary2bcd. It takes in an 8-bit input and outputs its BCD representation in 12-bits. The binary2bcd converter module assumes positive numbers only. 

Part 1 Simulation Results:
![Lab 1 Simulation](https://github.com/Spring-2023-Classes/lab-2-binary-to-bcd-unpaid-interns/blob/main/Lab2_Part%201/image.png)


<ins>Part 2:</ins>
Using the binary2bcd module from part 1 and the simple_calc module from lab 1 we are able to create a calculator that outputs the result in BCD to LEDs on the FPGA. 
We also created a comparator module which will check if the third bit of the result of simple_calc is 1 and if the user is doing the subtraction operation. If these conditions are true then the comparator will automatically take the 2's complement of the result before placing it into the binary2bcd converter. The final result is a simple calculator that outputs BCD responses to LEDs. We call it simple_calc_BCD

To control whether the calculator does Addition/Subtraction or Multiplication, we use an 8-bit 2x1 MUX. The Calculator has an operation select signal called op_sel that is a 2-bit input. The LSB of the op_sel signal controls the Adder/Subtractor (0 = addition, 1 = subtraction). The MSB of the op_sel signal is the select signal of the 8-bit 2x1 MUX (op_sel = 1x  means multiplication). 


Part 2: Circuit Diagram
![Part 2: Circuit Diagram](https://github.com/Spring-2023-Classes/lab-2-binary-to-bcd-unpaid-interns/blob/main/Lab_2_Part%202/Lab2_Part%202_Schematic.jpg)

Part 2: Testbench Results
![Part 2: =Testbench](https://github.com/Spring-2023-Classes/lab-2-binary-to-bcd-unpaid-interns/blob/main/Lab_2_Part%202/simple_calc_BCD.png)
