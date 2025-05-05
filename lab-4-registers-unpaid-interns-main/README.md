# lab-4-registers-unpaid-interns
lab-4-registers-unpaid-interns created by GitHub Classroom
## Group: Unpaid Interns
### Due: 3/1/2023

<ins>Part 1: Building a Register File</ins>
In part 1, we are a building a register file, *reg_file*, made up of flip flops. The register file contains 2<sup>N</sup> registers (rows) and each row is of size BITS (columns). There is a
read and a write port. The user can access the register file for reading and writing simultaneously. 

To Write:
*data_w* is an input used for the data the user wants to write into the file reg. The user must also specify the address *address_w* to write the data to. There is 
also the input Write enable *WE*. If the write enable is 1, the data will be written into the specified address of the file reg. 

To Read:
To read the data from a specified address, the user must input the specified address to the input *address_r*. The output *data_r* will then contain the value at the 
specified address.

The Reg file is parametrized. The two parameters are N and BITS. BITS represents the data to be inputted and the Reg File wil create 2^N registers depending on its value. 
The read and write port for the addresses both need a Nx2<sup>N</sup> decoder. The read port also needs 2<sup>N</sup> Tri-State Buffers.
The base registers are implemented from the *simple_register_load* module. 

Part 1 Schematic:
![Lab 3 Part 1 Schematic](https://github.com/Spring-2023-Classes/lab-4-registers-unpaid-interns/blob/main/Lab_4_Part_1/Lab4p1_schematic.jpg)

<ins>Part 1: Register File application</ins>
Part 1, also has a module called *reg_file_application* which combines our other modules to create a readable and writeable register file.

I/0 implementation for reg_file_application:
- SW 3 <- SW0  are connected to data_w 
- SW10 <- SW4 are used to specify address_w or address_r
- SW15 specifies reading or writing. If SW15 is a 1, then SW10 <- SW4 = read address. If SW15 = 0, SW10 <- SW4 is the write address
- WE is connected to the down push button
- data_r is connected to one of the seven seg digits


<ins>Part 2: Building an Accumulator (WREG) </ins>
This register stores the result of the last operation, it might also be used in the following operations. It will store and accumulate the result of an adder/subtractor module. The accumulator contains:
- a 4-bit register
- a 4-bit adder/subtractor module
- SW3 -> Sw0 connected to the input X
- SW15 connected to the Add/Sub input
- load connected to the down push button
- reset_n connected to the reset button
- the value stored in the accumulator is stored on one of the seven segment digits
