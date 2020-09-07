// MAIN CONTROL UNIT
// Generates all the control signals for all the stages
// Uses Instruction_Code of of the current instruction to compute the control signals
 
module Main_Control_Unit(Instruction_Code, RegWrite, Imm_Sel, ALU_Src, ALU_op);

// Declare inputs to Main_Control_Unit
input [31:0] Instruction_Code;

// Declare outputs from the Main_Control_Unit
output RegWrite;
output Imm_Sel;
output ALU_Src;
output [3:0] ALU_op;

// Declare intermediate signals
wire ALUop; //NOT TO BE CONFUSED WITH ALU_op 

//Generate Regwrite signal
assign RegWrite=1;

// Generate Imm_Sel signal
assign Imm_Sel=~(Instruction_Code[26]);

// Generate ALU_Src signal
assign ALU_Src = (Instruction_Code[5] ~^ Instruction_Code[4]) | Instruction_Code[26];

// Generate ALU_op signal
assign ALUop = Instruction_Code[26];
// Instantiate the ALU_Control_Unit
ALU_Control_Unit ALUCon(ALUop, Instruction_Code[5:0], ALU_op);

endmodule