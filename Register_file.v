// REGISTER FILE FOR INSTRUCTION DECODE UNIT
// contains 32, 32 bit registers that can be read 2 at a time asynchronously and written at positive clock edge

module Register_file(
input [4:0] Read_Reg_Num_1,
input [4:0] Read_Reg_Num_2,
input [4:0] Write_Reg_Num,
input [31:0]Write_Data,
input RegWrite,
input clk,
input reset,
output [31:0] Read_Data_1,
output [31:0] Read_Data_2
);

//32 32-bit Registers
reg [31:0] Reg [0:31];

//Asynchronously read data 
assign Read_Data_1=Reg[Read_Reg_Num_1]; //Read data present a register location referenced to by Read_Reg_Num_1 into Read_Data_1

assign Read_Data_2=Reg[Read_Reg_Num_2]; //Read data present a register location referenced to by Read_Reg_Num_2 into Read_Data_2

always @ (posedge clk)
begin

//Write data into registers depending on state of RegWrite at positive edge of clock
if(RegWrite)
begin
	Reg[Write_Reg_Num] <= Write_Data;  //Reg referenced to by Write Reg_Num is conferred the value carried by Write_Data
end
end
//Write numbers into registers on reset(active low). Here reset is given to be an asynchronous input.
always @ (negedge reset)
begin
	Reg[0]=0; Reg[1]=1; Reg[2]=2; Reg[3]=3; Reg[4]=4;
	Reg[5]=5; Reg[6]=6; Reg[7]=7; Reg[8]=8; Reg[9]=7;
	Reg[10]=10; Reg[11]=11; Reg[12]=12; Reg[13]=13;
	Reg[14]=14;	Reg[15]=15; Reg[16]=16; Reg[17]=17;
	Reg[18]=18; Reg[19]=19; Reg[20]=20; Reg[21]=21;
	Reg[22]=22; Reg[23]=23; Reg[24]=24; Reg[25]=25;
	Reg[26]=26; Reg[27]=27; Reg[28]=28; Reg[29]=29;
	Reg[30]=30; Reg[31]=31;
end

endmodule