module Opcode(ibus,I,S,Cin);
input [31:0]ibus;
output reg I, Cin;
output reg [2:0]S;

always@(*)
begin

if (ibus[31:26] == 6'b000011) begin I = 1'b1; S = 3'b010; Cin = 1'b0; end
else if (ibus[31:26] == 6'b000010) begin I = 1'b1; S = 3'b011; Cin = 1'b1; end
else if (ibus[31:26] == 6'b000001) begin I = 1'b1; S = 3'b000; Cin = 1'b0; end
else if (ibus[31:26] == 6'b001111) begin I = 1'b1; S = 3'b110; Cin = 1'b0; end
else if (ibus[31:26] == 6'b001100) begin I = 1'b1; S = 3'b100; Cin = 1'b0; end

else if (ibus[31:26] == 6'b000000 && ibus[5:0] == 6'b000011) begin I = 1'b0; S = 3'b010; Cin = 1'b0; end
else if (ibus[31:26] == 6'b000000 && ibus[5:0] == 6'b000010) begin I = 1'b0; S = 3'b011; Cin = 1'b1; end
else if (ibus[31:26] == 6'b000000 && ibus[5:0] == 6'b000001) begin I = 1'b0; S = 3'b000; Cin = 1'b0; end
else if (ibus[31:26] == 6'b000000 && ibus[5:0] == 6'b000111) begin I = 1'b0; S = 3'b110; Cin = 1'b0; end
else if (ibus[31:26] == 6'b000000 && ibus[5:0] == 6'b000100) begin I = 1'b0; S = 3'b100; Cin = 1'b0; end
else begin I = 1'b0; S = 3'b111; Cin = 1'b0; end
end
endmodule
