// PROCESSOR DATAPATH AND CONTROL
// In this module we will make the internal connections between modules to implement the single cycle implementation
// All control signals will be brought from the main control unit

module RI_datacontpath(clk, reset,Zero);

// Declare the inputs
input clk;
input reset;

// Declare the output
output Zero;

// Signals from the main control unit
wire RegWrite;
wire Imm_Sel;
wire ALU_Src;
wire [3:0] ALU_op;

// Declare the intermediate signals
// (1) From and into Instruction_Fetch Unit
wire [31:0] Instruction_Code;

// (2) From and into Instruction_Decode Unit
wire [31:0] Write_Data;
wire [31:0] Read_Data_1;
wire [31:0] Read_Data_2;
wire [31:0] Gen_Imm_Data;

// (3) From Execution_Unit
// No signal as all signals have been declared in the preceding stages

//Instantiate Instruction_fetch Unit 
Instruction_Fetch IF(clk, reset, Instruction_Code);

// Instantiate the Main_Control_Unit
Main_Control_Unit MCU(Instruction_Code, RegWrite, Imm_Sel, ALU_Src, ALU_op);

//Instantiate Instruction_Decode Unit
Instruction_Decode ID(clk, reset, Instruction_Code, RegWrite, Imm_Sel, Write_Data, Read_Data_1, Read_Data_2, Gen_Imm_Data);

//Instantiate Execution Unit
Execution_Unit EX(Read_Data_1,Read_Data_2, Gen_Imm_Data, ALU_Src, ALU_op, Write_Data,Zero);

endmodule