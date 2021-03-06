module ALU(a,b,d,S,V,Cin,Cout);

	input [31:0] a,b;
	output [31:0] d;
	input [2:0] S;
	output Cout, V;
	input Cin;
	
	wire [31:0] g,p,C;
	wire Gout, Pout;

	alu2b zero(a[0], b[0], d[0], S, g[0], p[0], C[0]);
	alu2b one(a[1], b[1], d[1], S, g[1], p[1], C[1]);
	alu2b two(a[2], b[2], d[2], S, g[2], p[2], C[2]);
	alu2b three(a[3], b[3], d[3], S, g[3], p[3], C[3]);
	alu2b four(a[4], b[4], d[4], S, g[4], p[4], C[4]);
	alu2b five(a[5], b[5], d[5], S, g[5], p[5], C[5]);
	alu2b six(a[6], b[6], d[6], S, g[6], p[6], C[6]);
	alu2b seven(a[7], b[7], d[7], S, g[7], p[7], C[7]);
	alu2b eight(a[8], b[8], d[8], S, g[8], p[8], C[8]);
	alu2b nine(a[9], b[9], d[9], S, g[9], p[9], C[9]);
	alu2b ten(a[10], b[10], d[10], S, g[10], p[10], C[10]);
	alu2b eleven(a[11], b[11], d[11], S, g[11], p[11], C[11]);
	alu2b twelve(a[12], b[12], d[12], S, g[12], p[12], C[12]);
	alu2b thirteen(a[13], b[13], d[13], S, g[13], p[13], C[13]);
	alu2b fourteen(a[14], b[14], d[14], S, g[14], p[14], C[14]);
	alu2b fifteen(a[15], b[15], d[15], S, g[15], p[15], C[15]);
	alu2b sixteen(a[16], b[16], d[16], S, g[16], p[16], C[16]);
	alu2b seventeen(a[17], b[17], d[17], S, g[17], p[17], C[17]);
	alu2b eighteen(a[18], b[18], d[18], S, g[18], p[18], C[18]);
	alu2b nineteen(a[19], b[19], d[19], S, g[19], p[19], C[19]);
	alu2b twenty(a[20], b[20], d[20], S, g[20], p[20], C[20]);
	alu2b twentyone(a[21], b[21], d[21], S, g[21], p[21], C[21]);
	alu2b twentytwo(a[22], b[22], d[22], S, g[22], p[22], C[22]);
	alu2b twentythree(a[23], b[23], d[23], S, g[23], p[23], C[23]);
	alu2b twentyfour(a[24], b[24], d[24], S, g[24], p[24], C[24]);
	alu2b twentyfive(a[25], b[25], d[25], S, g[25], p[25], C[25]);
	alu2b twentysix(a[26], b[26], d[26], S, g[26], p[26], C[26]);
	alu2b twentyseven(a[27], b[27], d[27], S, g[27], p[27], C[27]);
	alu2b twentyeight(a[28], b[28], d[28], S, g[28], p[28], C[28]);	
	alu2b twentynine(a[29], b[29], d[29], S, g[29], p[29], C[29]);
	alu2b thirty(a[30], b[30], d[30], S, g[30], p[30], C[30]);
	alu2b thirtyone(a[31], b[31], d[31], S, g[31], p[31], C[31]);

	lac32 lac(g, p, Cin, Gout, Pout, C);

	assign Cout = Gout | (Pout & Cin);
	assign V = Cout ^ C[31];
	
endmodule

module alu2b(a,b,sum,sel,g,p,Cin);
	
	input a,b,Cin;
	input [2:0] sel;
	output sum, g, p;
	reg sum;
	
	wire bint, cint;

	assign bint = b ^ sel[0];
	assign cint = Cin & sel[1];
	assign g = a & bint;
	assign p = a ^ bint;

	always @(*)

	begin
		case (sel)
			3'b000: sum = a ^ b; 
			3'b001: sum = ~(a ^ b); 
			3'b010: sum = p ^ cint; 
			3'b011: sum = p ^ cint; 
			3'b100: sum = a | b; 
			3'b101: sum = ~(a | b);
			3'b110: sum = a & b; 
			3'b111: sum = 0; 
		endcase
	end
endmodule

module lac2(g,p,Cin,Gout,Pout,C);

	input [1:0] g, p;
	input Cin;
	output Gout, Pout;
	output [1:0] C;

	assign Gout = (g[0] & p[1]) | g[1];
	assign Pout = p[0] & p[1];
	assign C[0] = Cin;
	assign C[1] = (p[0] & C[0]) | g[0];

endmodule

module lac4(g,p,Cin,Gout,Pout,C);

	input [3:0] g, p;
	input Cin;
	output Gout, Pout;
	output [3:0] C;

	wire [1:0] tempc;
	wire [1:0] tempg;
	wire [1:0] tempp;

	lac2 left(g[3:2], p[3:2], tempc[1], tempg[1], tempp[1], C[3:2]);
	lac2 right(g[1:0], p[1:0], tempc[0], tempg[0], tempp[0], C[1:0]);
	lac2 main(tempg, tempp, Cin, Gout, Pout, tempc);

endmodule

module lac8(g,p,Cin,Gout,Pout,C);

	input [7:0] g, p;
	input Cin;
	output Gout, Pout;
	output [7:0] C;

	wire [1:0] tempc;
	wire [1:0] tempg;
	wire [1:0] tempp;

	lac4 left(g[7:4], p[7:4], tempc[1], tempg[1], tempp[1], C[7:4]);
	lac4 right(g[3:0], p[3:0], tempc[0], tempg[0], tempp[0], C[3:0]);
	lac2 main(tempg, tempp, Cin, Gout, Pout, tempc);

endmodule

module lac16(g,p,Cin,Gout,Pout,C);

	input [15:0] g, p;
	input Cin;
	output Gout, Pout;
	output [15:0] C;

	wire [1:0] tempc;
	wire [1:0] tempg;
	wire [1:0] tempp;

	lac8 left(g[15:8], p[15:8], tempc[1], tempg[1], tempp[1], C[15:8]);
	lac8 right(g[7:0], p[7:0], tempc[0], tempg[0], tempp[0], C[7:0]);
	lac2 main(tempg, tempp, Cin, Gout, Pout, tempc);

endmodule

module lac32(g,p,Cin,Gout,Pout,C);

	input [31:0] g, p;
	input Cin;
	output Gout, Pout;
	output [31:0] C;

	wire [1:0] tempc;
	wire [1:0] tempg;
	wire [1:0] tempp;

	lac16 left(g[31:16], p[31:16], tempc[1], tempg[1], tempp[1], C[31:16]);
	lac16 right(g[15:0], p[15:0], tempc[0], tempg[0], tempp[0], C[15:0]);
	lac2 main(tempg, tempp, Cin, Gout, Pout, tempc);

endmodule
