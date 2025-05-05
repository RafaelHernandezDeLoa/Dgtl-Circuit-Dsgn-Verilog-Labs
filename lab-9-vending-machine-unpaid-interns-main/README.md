# lab-9-vending-machine-unpaid-interns
lab-9-vending-machine-unpaid-interns created by GitHub Classroom
## Unpaid Interns: Carlos Zarco and Rafael Hernandez
### Due: 4/12/2023

<ins> Vending Machine HDL Code and FPGA Implementation:</ins>
For this lab, we were tasked to create a verilog module that will allow us to run vending machine like operations on our FPGA boards. We had to create a module that will allow us to insert inputs of nickles, dimes and quarters to allow us to get an item every time we insert 25 cents or more in our program. Once more than 25 cents is inserted, the FPGA board would stop accepting these inputs and notify the user throught an RGB LED light that an item has been dispensed. We are then required to press a button to simulate us taking the dispensed item from the vending machine and allowing us to input money into the machine again to get another item. We also have to display the amount of money that we have inserted and the amount of change we will receive back when we inputted more than 25 cents. The LEDs on the FPGA board would light up to correspond to the amount of change we will recieve back. The right most LED will light up to signify that we get a nickle back. The LED next to it will light up to signify that I will be getting one dime back. The LED next to this one will light up to signify that I will be getting two dimes back.

Lab 9: Vending Machine State Diagram ![Lab 9: Vending Machine State Diagram](https://github.com/Spring-2023-Classes/lab-9-vending-machine-unpaid-interns/blob/6d5eaba710e62ab82b6a59feeb1113b131366d21/Lab9_vending_machine/Lab9_Vending_Machine_FSM.jpg)
