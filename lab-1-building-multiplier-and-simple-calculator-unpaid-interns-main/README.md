# Lab 1 - Building a Multiplier Circuit and Simple Calculator
## Unpaid Interns: Carlos Zarco and Rafael Hernandez
### Due: 2/8/2023

<ins>Part 1:</ins>
A binary multiplier can be implemented through multiple instantiations of Ripple Carry Adders, however they are inefficient since each operation is dependent on recieving preceding carries in order for the final output to be displayed. To combat this in the implementation of our Multiplier circuit we used a **carry save array** configuration. m<sub>i</sub>q<sub>j</sub> was implemented using a 2-input and gate. We instantiated a module called mq_4bit which takes in a 4-bit signal * *m * * and 1-bit signal * *q* *. Using full adders and mq_4-bit modules, we were able to create a  multiplier. The multiplier takes in 4-bit inputs and outputs 8-bit results.

Part 1 Simulation Results:
![Lab 1 Simulation](https://github.com/Spring-2023-Classes/lab-1-building-multiplier-and-simple-calculator-unpaid-interns/blob/main/Lab_1_Part_1/Lab%201%20Simulation.png)


<ins>Part 2:</ins>
For Part 2, we use the multiplier circuit modules and an Adder/Subtractor module to create a simple calculator that performs the following operations:
- 4-bit Addition
- 4-bit Subtraction
- 4-bit Multiplication (with an 8-bit output)

To control whether the calculator does Addition/Subtraction or Multiplication, we use an 8-bit 2x1 MUX. The Calculator has an operation select signal called op_sel that is a 2-bit input. The LSB of the op_sel signal controls the Adder/Subtractor (0 = addition, 1 = subtraction). The MSB of the op_sel signal is the select signal of the 8-bit 2x1 MUX (0 = Addition/Subtraction, 1 = Multiplication).  

Part 2: Circuit Diagram
![Part 2: Circuit Diagram](https://github.com/Spring-2023-Classes/lab-1-building-multiplier-and-simple-calculator-unpaid-interns/blob/main/Lab_1_Part_2/Lab%201%20Part%202%20Diagram.jpg)
