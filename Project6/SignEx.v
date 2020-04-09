module SignEx(A,Q);

input [15:0] A;
output [31:0] Q;

assign Q[15:0] = A[15:0];

assign Q[16] = A[15];
assign Q[17] = A[15];
assign Q[18] = A[15];
assign Q[19] = A[15];

assign Q[20] = A[15];
assign Q[21] = A[15];
assign Q[22] = A[15];
assign Q[23] = A[15];

assign Q[24] = A[15];
assign Q[25] = A[15];
assign Q[26] = A[15];
assign Q[27] = A[15];

assign Q[28] = A[15];
assign Q[29] = A[15];
assign Q[30] = A[15];
assign Q[31] = A[15];

endmodule;