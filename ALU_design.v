//ALU DESIGN FOR THE EXECUTION UNIT
// acts on 2 32 bit inputs and controlled by ALU_operation signal
// can perform 'AND', 'OR', 'ADD', 'SUBTRACT' and 'SLT' operations
// Also has a zero output used to detect if result is zero

module ALU_design(A,B,cline,res,zero);
	input signed[31:0] A,B;
	input [3:0] cline;
	output reg[31:0] res;
	output reg zero;	
	always@(*)
	begin
		case(cline)
		4'b0000: res=A & B;  //(bitwise AND)
		4'b0001: res=A | B;  //(bitwise OR)
		4'b0010: res=A + B;  //(Add A+B)
		4'b0011: res=A - B;  //(Subtract A-B)
		4'b0100: res=A << B; //(Shift logical left)
		4'b0101: res=A >> B; //(Shift logical right)
		4'b0111: res=B;		 // (Simply outputs B; useful for li)
		endcase		
		if (res==0)
		zero=1;
		else
		zero=0;
	end
endmodule