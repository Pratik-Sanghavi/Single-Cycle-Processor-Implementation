//INSTRUCTION MEMORY FOR INSTRUCTION FETCH UNIT
// contains 36 byte organised data units that are referenced to by the PC 

module Instruction_Memory(
input [31:0] PC,
input reset, 
output [31:0] Instruction_Code
);
reg [7:0] Mem [35:0]; 
//byte addressable memory

//For normal memory read we use the following statement
assign Instruction_Code=reset?{Mem[PC+3],Mem[PC+2],Mem[PC+1],Mem[PC+0]}:32'hZZZZZZZZ;
// reads Instruction Code specified by PC in Little Endian Format

//handling reset condition
always@(reset)
begin
if(reset==0) //if reset input is equal to logic zero
// Initialize the memory with 4 instructions
	begin
	Mem[3]=8'hFC; Mem[2]=8'h00; Mem[1]=8'h00; Mem[0]=8'h01;
	// First 32-bit location with data 0xFC000001 equivalent to instruction li r0,1
	//Note: Little Endian Memory organization
	Mem[7]=8'h00; Mem[6]=8'h01; Mem[5]=8'h10; Mem[4]=8'h20;
	//Next 32-bit location with data 0x00011020 equivalent to instruction add r0,r1,r2
	Mem[11]=8'h01; Mem[10]=8'h09; Mem[9]=8'h50; Mem[8]=8'h24;
	//Next 32-bit location with data 0x01095024 equivalent to instruction and r8,r9,r10
	Mem[15]=8'h01; Mem[14]=8'h66; Mem[13]=8'h01; Mem[12]=8'h80;
	//Next 32-bit location with data 0x01660180 equivalent to instruction sll r11,r6,6
	Mem[19]=8'h01; Mem[18]=8'h28; Mem[17]=8'h50; Mem[16]=8'h25;
	//Next 32-bit location with data 0x01285025 equivalent to or r9,r8,r10
	
	end	
end
endmodule