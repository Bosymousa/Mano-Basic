//`include "D_FlipFlop16.v"
module AC(Q, INR, Data, LD, CLK, CLR);

	output reg [7:0] Q;
	input [7:0] Data;
	input INR, LD, CLK, CLR;
	
	always @(posedge CLK or posedge CLR)
		begin
			if(CLR)
				Q = 8'b0;
			else if(LD)
				Q = Data;
		end	
		
endmodule
