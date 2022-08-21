# Single-Cycle-Processor-Implementation
A simple single cycle implementation of a processor able to execute a subset of RISC V ISA

## The Design:

The overall design is as follows:<br>

![single-cycle-processor](https://github.com/PratikSangh/Single-Cycle-Processor-Implementation/blob/master/RTL%20Diagrams/Block%20Diagram.jpg)

The instruction fetch unit gets the next instruction in one clock cycle.<br>
The main control unit generates the control signals required for the instruction decode unit.
The Instruction Decode Unit Decodes the opcode and takes in control signals from the main control unit for get the data and pass it to the execution unit.
The execution unit performs the required operation and generates the output
