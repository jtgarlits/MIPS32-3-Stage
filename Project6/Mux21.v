module Mux21(A, B, sel, out);

input [31:0]A, B;
input sel;
output reg [31:0]out;

always @ (*)
begin 
case (sel)
1'b0: out = A;
1'b1: out = B;
endcase
end
endmodule
