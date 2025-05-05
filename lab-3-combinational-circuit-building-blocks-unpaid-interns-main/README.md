# lab-3-combinational-circuit-building-blocks-unpaid-interns
lab-3-combinational-circuit-building-blocks-unpaid-interns created by GitHub Classroom
## Unpaid Interns: Carlos Zarco and Rafael Hernandez
### Due: 2/22/2023

<ins>Part 1:</ins>
For this section of the lab, we demonstrated the functionality of a priority encoder in a module called prior_encoder_test. We assigned it's inputs to switches 0-15 on 
the Nexys A7-100T and it's outputs to a single seven segment display. The output of the encoder was sent into our hex2sseg code converter from the previous lab.  

Part 1 prior_encoder_test Schematic:
![Lab 3 Part 1 Schematic](https://github.com/Spring-2023-Classes/lab-3-combinational-circuit-building-blocks-unpaid-interns/blob/main/Lab_3_Part_1/Part1_schematic.jpg)


<ins>Part 2: Building a rudimentary seven-segment display driver</ins>

Using the  hex2sseg.v and decoder_generic.v modules, we were able to design a rudimentary seven-segment display driver called first_sseg_driver.
The driver has the following I/O specifications:
- 3-bit input active_digit: Selects one of the 8 seven-segment displays to activate.
- 4-bit input num: Contains the binary number to be displayed.
- 1-bit imput DP_ctrl: To turn decimal point on or off.
- 7-bit output sseg: Output of the hex2sseg module.
- 8-bit output AN: Controls the transistor for each sseg display. (0 = ON, 1 = OFF)
- 1-bit output DP: DP is assigned to DP_ctrl to reflect the status of the input on the appropriate sseg display.

Part 2 first_sseg_driver Schematic:
![Lab 3 Part 2: Circuit Diagram](https://github.com/Spring-2023-Classes/lab-2-binary-to-bcd-unpaid-interns/blob/main/Lab_2_Part%202/Lab2_Part%202_Schematic.jpg))

We also designed a test system called first_sseg_driver_test with the following I/O specifications:
- 3-bit input X: Connected to switches 0-3.
- Seven-segment control signals (AN, DP, sseg etc.) connected to their appropriate output from the system.
The goal of this section was to build a test circuit that takes a 3-bit input X and displays the value of X on a sseg display. The location of the activated 
digit will be the same as the value of X (assuming the first sseg on the right is 0). We tested this by changing the value X from 0-7 and seeing it light up at each 
corresponding sseg display.

If we were able to change the input of the X very quickly (like 30 times a second) then it would appear as if multiple sseg displays were on at the same time. There 
could also be flickering effects.

<ins>Part 3: Using the rudimentary seven-segment display driver at the output of a simple 
calculator </ins>

We are using the display driver from part 2 and susing it to display the output of the modified simple_calc module from lab 2. The module outputs the result in BCD form
so we called it simple_calc_BCD. The digits of the result can only be displayed one at a time and we are assuming unsigned numbers for this section of the lab. 
The calculator should perform 4-bit addition, subtraction, multiplication, and  a utilizes a binary-to-BCD converter to generate a 3 digit BCD (or 12-bit) result.
We imported the module simple_calc_BCD which has the following I/O specifications:
- op_sel = 00 (add)
- op_sel = 01 (subtract)
- op_sel = 1x (multiply)
We also imported the bin2bcd covnerter from lab 2 to convert the 8-bit binary output to its equivalent 12-bit BCD form. Lastly we imported a 4x1 mux mux_4x1_nbit 
where the number of bits for the input is parametrized. We separated the 12-bit BCD result into 3 BCD digits (4-bit each) and connected each of the 
digits to one of the inputs of the 4x1 MUX. Finally, we used the display driver to output the 3-digit results on sseg displays 4,5, and 6.
simple_calc_first_sseg is implemented on the FPGA board as follows:
- SW3-SW0 for the input X
i- SW7-SW4 for the input Y
- SW9-SW8 to control which seven-segment digit is activated (these 
switches will select digits 4, 5, 6, 7)
- SW15-SW14 for the op_sel
- Seven-Segment7 ß Seven-Segment4 for the output BCD result
- LED14 to display the carry_out of the adder/subtractor
- LED15 to display the overflow of the adder/subtractor

Part 3 simple_calc_first_sseg Schematic:
![Lab 3 Part 1 Schematic](https://github.com/Spring-2023-Classes/lab-3-combinational-circuit-building-blocks-unpaid-interns/blob/main/Lab3_p3/Part3_Schematic.jpg)

