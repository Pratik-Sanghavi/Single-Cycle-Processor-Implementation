//TESTBENCH FOR RI_DATACONTPATH

module tb_RI_datacontpath();

//Inputs to RI_datacontpath
reg clk;
reg reset;

// Outputs from RI_datacontpath
wire Zero;

//Instantiate RI_datacontpath
RI_datacontpath RI(clk, reset,Zero);

//Initialize clock and set period
initial
begin
	clk=1'b0;
	repeat (11)
	#10 clk =~clk;
end

initial
begin
reset=0; //reset is level-triggered as per our implementation
#5 reset=1;
#110 ; //finish at 101 clock time- just enough to run through all our 5 instructions 
end

endmodule