# lab-10-morse-decoder-unpaid-interns
lab-10-morse-decoder-unpaid-interns created by GitHub Classroom
## Unpaid Interns: Carlos Zarco and Rafael Hernandez
### Due: 4/19/2023

<ins> Part 1: Morse Decoder</ins>

For this part of lab, we were tasked to create a Morse Decoder module that will accept one input, b, and will have four outputs, dot, dash, lg and wg. Depending one how long b has been asserted as a "1" or "0", one or none of the outputs will be asserted to reflect the current value of b and how long b had this value for. The dot output will be asserted only when b has been asserted to "1" for zero to two units of time (with each unit of time equal to 50 ms). The dash output will be asserted only when b has been asserted for three to five units of time. The lg output will be asserted only when b has been "0" or deasserted for three to five units of time. The wg output will be asserted only when b has been deasserted for more than six units of time. The outputs dot and dash tells us that we are trying to convey a dot or dash in the morse code message we are trying to convey. The output lg is used to express that we are starting and expressing on a new letter with our "dots" and "dashs" we output next. The output wg is used to express that we are starting to express a new word when we output "dots" and "dashes" from our decoder. We created a module of the finite state machine involved in checking what state the decoder is in to help determine which outputs should be asserted and to help determine the behavior of the decoder. A diagram showing a clearer picture of the decoder's operation is shown below.


<ins> Part 2: Morse Decoder Application</ins>

In our Morse Decoder module, we implemented several modules in order to make the morse decoder's function visible on our FPGA board. In our morse decoder applications module which achieves this task, we have the modules we need to run our morse decoder properly. We have the fsm for the decoder along with a timer and udl counter to help count how many units of time have passed so we can make sure that the fsm will assure the right output at the right time. The rest of the code in the module are used to make it possible for us to show are results from the morse decoder on our boards. We have included a shift register to shift our inputs into our seven segment display, an other udl counter to show us how many dashes and dots we created, a segment driver and some code to help display the necesary information onto our boards.

Lab 10: Morse Decoder Finite State Machine ![Lab 10: Morse Decoder Finite State Machine](https://github.com/Spring-2023-Classes/lab-10-morse-decoder-unpaid-interns/blob/b9752db95e4955311e289f37c9b4b0cb5d4d713f/Lab_10_fsm.jpg)
