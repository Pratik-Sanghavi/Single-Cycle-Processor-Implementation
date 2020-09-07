// IMMEDIATE GENERATE MODULE FOR INSTRUCTION DECODE SEGMENT:
// Maps and places each bit in the correct location as per instruction type
// Sign extends the resulting code to be suitably processed further by the ALU
// Control signal in this module is the Imm_Sel

module Immediate_Generate(Instruction_Code, Imm_Sel, Gen_Imm_Data);

// Declaration of inputs to the unit
input [20:0] Instruction_Code;
input Imm_Sel;

// Declaration of the output from this stage
output reg [31:0] Gen_Imm_Data;

always@(*)
begin

case(Imm_Sel)
// Generate immediate data in proper order (sign extension follows this step); Sign-extension of immediate data to be processed by the next-stage ALU
2'b0: Gen_Imm_Data[31:0]<={{11{Instruction_Code[20]}},Instruction_Code[20:0]}; // for li instruction
2'b1: Gen_Imm_Data[31:0]<=Instruction_Code[10:6]; // for sll/srl instruction

endcase 

end

endmodule