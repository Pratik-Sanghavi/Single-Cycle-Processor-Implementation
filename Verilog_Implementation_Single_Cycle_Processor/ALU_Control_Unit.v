// ALU CONTROL UNIT
// Generates ALU_op
// ALUop function:
// 0 -> R-type; 1-> I-type; 
//4'b0000:  (bitwise AND)
//4'b0001:  (bitwise OR)
//4'b0010:  (Add A+B)
//4'b0011:  (Subtract A-B)
//4'b0100:  (Shift logical left)
//4'b0101:  (Shift logical right)
//4'b0111:  (Simply outputs B; useful for li)

module ALU_Control_Unit(ALUop, funct, ALU_op);

// Declare inputs
input ALUop; //from Main_Control_Unit
input [5:0] funct; //from Instruction_Fetch Unit

// Declare output
output reg [3:0] ALU_op; 

// Intermediate signals useful for generation of ALU_op
wire [4:0] select;
assign select = {ALUop, funct[5], funct[2], funct[1], funct[0]};

always @(*)
begin

//li operation
if(select[4]==1) 
begin
	ALU_op[3:0]=4'b0111;
end

// add operation
if(select[4:0] == 5'b01000)
begin
	ALU_op[3:0]=4'b0010;
end

//sub operation
if(select[4:0] == 5'b01010)
begin
	ALU_op[3:0]=4'b0011;
end

//and operation
if(select[4:0] == 5'b01100)
begin
	ALU_op[3:0]=4'b0000;
end

//or operation
if(select[4:0] == 5'b01101)
begin
	ALU_op[3:0]=4'b0001;
end

//sll operation 
if(select[4:0] == 5'b00000)
begin
	ALU_op[3:0]=4'b0100;
end

//srl operation
if(select[4:0] == 5'b00010)
begin
	ALU_op[3:0]=4'b0101;
end

end
endmodule