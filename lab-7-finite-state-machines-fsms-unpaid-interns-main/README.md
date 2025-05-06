# lab-7-finite-state-machines-fsms-unpaid-interns
lab-7-finite-state-machines-fsms-unpaid-interns created by GitHub Classroom
## Group: Unpaid Interns
### Due: 3/22/2023

<ins>Part 1: Finite State Machines (FSMs)</ins>
Dual Sequence Detector: This is a Mealy FSM with an input x, output y, clock, and reset_n input. It detects the following two sequences: 010 and 1001. It allows overlap. Since it is a Mealy, matching the input x should be in the assignment statement for y. 

Even Odd Consecutive: This is a Moore FSM with an input x, output y, clock, and reset_n input. It is asserted when the number of 1's received is odd and at lest two consecutive 0's have been received.

Lab 7 Part 1: Dual Sequence Detector State Diagram shown below.
![Lab 7 Dual Sequence Detector State Diagram](https://github.com/Spring-2023-Classes/lab-7-finite-state-machines-fsms-unpaid-interns/blob/main/Lab7_p1/dual_sequence_lab7_part1.png)

Lab 7 Part 1: Even Odd Consecutive State Diagram shown below.
![Lab 7 Dual Sequence Detector State Diagram](https://github.com/Spring-2023-Classes/lab-7-finite-state-machines-fsms-unpaid-interns/blob/main/Lab7_p1/Even_odd_lab7_part1.png)

<ins>Part 2: 111 and 000 Sequence Detector Finite State Machines (FSMs)</ins>
We designed a Mealy machine with an input x, output y, clock, and reset_n input. It has 7 states, S0 -> S6. We realized after implementation that this could have been achieved in less states, however it would still use 3 flip-flops. It would cost the same to implement either way but the diagram would be more simple without s3 and s5. I could have had the state diagram loop back to itself at both s3 and s5 instead of creating two new states (s6 and s3) for the sequences they are detecting. The state diagram we designed is included below.

Lab 7 Part 2: 111 and 000 Detector (Mealy FSM)
![Lab 7 Part 2 FSM](https://github.com/Spring-2023-Classes/lab-7-finite-state-machines-fsms-unpaid-interns/blob/main/Lab7_p2/lab7_part2_state_diagram.jpg)



