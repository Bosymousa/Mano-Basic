//`include "D_FlipFlop12.v"

module PC(Q, INR, Data, Load, CLK, CLR);

	output [3:0] Q;
	input [3:0] Data;
	input INR, Load, CLK, CLR;

	wire [3:0] inr012, Sum, moshtarak;
	wire cout;

	reg [3:0] out;
	assign inr04 = INR ? 12'b0001 : 4'b0;
	assign {cout , Sum} = inr04 + out;

	if (INR)
		assign moshtarak = Sum;
	if (Load)
		assign moshtarak = Data;

	wire en;
	assign en = Load^INR;

	always @(posedge CLK or posedge CLR)
		begin
			if(CLR)
				out <= 4'b0;
			else if(en)
				out <= moshtarak;
		end
	
	assign Q = out;
	
endmodule