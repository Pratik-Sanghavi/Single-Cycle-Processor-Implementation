// STAGE 1: INSTRUCTION FETCH UNIT
// This unit fetches the instruction code at the location pointed to by the program counter.
// Program counter may be incremented by 4 or jump to another location entirely depending on the output of the "PC Source MUX"
// Control signal in this segment is reset for the PC

module Instruction_Fetch(clk, reset, Instruction_Code);

// Declare the inputs
input clk;
input reset;

// Declare the outputs
output [31:0] Instruction_Code;

//Declare registered/latched pointer
reg [31:0] PC;

// Instantiate the Instruction memory module
Instruction_Memory I1(PC, reset, Instruction_Code);

always @(posedge clk or negedge reset)
begin
if (reset==0)
begin
	PC <=0;
end

else
begin
	PC<=PC+4;
end

end

endmodule