module DFF3(D,clk,Q);
input [2:0] D; // Data input 
input clk; // clock input 
output reg [2:0] Q; // output Q 
always @(posedge clk) 
begin
 Q <= D; 
end 
endmodule 
