module AC_Arthemetic_Unit(AC, AND, DR, ADD, INPR, INPT, DR0, COM, SHL, E, SHR, ACDATA, cout); 
	
	input [7:0] INPR;
	input [7:0] AC, DR;

	input AND, ADD, INPT, DR0, COM, SHL, E, SHR;

	output cout;
	output [7:0] ACDATA;

	wire [7:0] or1, or2, or3, or4, or5, or6, or7;
	wire [7:0] o4, o3, o, o1;
	
	wire [7:0] and8, add8, dr8, com8, shl8, e08, e18, shr8, a808;
	wire [3:0] inpt8;
	
	assign and16 = (AND ? 8'b1 :8'b0);
	assign or1 = AC & and16 & DR;
	
	assign {Cout , Sum} = DR + AC;
	assign cout = Cout;
	
	assign add16 = (ADD ? 8'b1 : 8'b0);
	assign or2 = add16 & Sum;
	
	assign dr16 = (DR0 ? 8'b1 : 8'b0);
	assign or3 = dr16 & DR;
	
	assign inpt8 = (INPT ? 8'b1: 8'b0);
	assign d = inpt8 & INPR;
	
	assign or4 = {8'b0000, d};
	
	assign com16 = (COM ? 8'b1 : 8'b0);
	assign or5 = (~AC) & com8;
	
	assign shl8 = (SHL ? 8'b1 : 8'b0);
	assign acshl = AC << 1;
	assign e08 = {7'b0, E};
	assign o = acshl | e08;
	assign e116 = {7'b1, E};
	assign o1 = e18 & o;
	assign or6 = shl8 & o1;
	
	wire[7:0] acshr, e0shift, e1shift;
	assign acshr = AC>>1;
	//shift charkheshi
	assign e0shift = E ? 8'b10000000 : 8'b0;
	assign o3 = acshr | e0shift;
	assign e1shift = (E ? 8'b11111111 : 8'b01111111);
	assign o4 = e1shift & o3;
	
	assign shr8 = (SHR ? 8'b11111111 : 8'b0);
	
	assign or7 = shr8 & o4;
	
	assign ACDATA = or1 | or2 | or3 | or4 | or5 | or6 | or7;
	
endmodule