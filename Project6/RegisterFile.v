module RegisterFile(Aselect, Bselect, Dselect, clk, abus, bbus, dbus);
input [31:0] Aselect, Bselect, Dselect, dbus;
input clk;
output [31:0] abus, bbus;
wire [31:0] R0Val = 32'b00000000000000000000000000000000;

oneWordx32bit R0(R0Val,Aselect[0],Bselect[0],Dselect[0],clk,abus,bbus);
oneWordx32bit R1(dbus,Aselect[1],Bselect[1],Dselect[1],clk,abus,bbus);
oneWordx32bit R2(dbus,Aselect[2],Bselect[2],Dselect[2],clk,abus,bbus);
oneWordx32bit R3(dbus,Aselect[3],Bselect[3],Dselect[3],clk,abus,bbus);
oneWordx32bit R4(dbus,Aselect[4],Bselect[4],Dselect[4],clk,abus,bbus);
oneWordx32bit R5(dbus,Aselect[5],Bselect[5],Dselect[5],clk,abus,bbus);
oneWordx32bit R6(dbus,Aselect[6],Bselect[6],Dselect[6],clk,abus,bbus);
oneWordx32bit R7(dbus,Aselect[7],Bselect[7],Dselect[7],clk,abus,bbus);
oneWordx32bit R8(dbus,Aselect[8],Bselect[8],Dselect[8],clk,abus,bbus);
oneWordx32bit R9(dbus,Aselect[9],Bselect[9],Dselect[9],clk,abus,bbus);
oneWordx32bit R10(dbus,Aselect[10],Bselect[10],Dselect[10],clk,abus,bbus);
oneWordx32bit R11(dbus,Aselect[11],Bselect[11],Dselect[11],clk,abus,bbus);
oneWordx32bit R12(dbus,Aselect[12],Bselect[12],Dselect[12],clk,abus,bbus);
oneWordx32bit R13(dbus,Aselect[13],Bselect[13],Dselect[13],clk,abus,bbus);
oneWordx32bit R14(dbus,Aselect[14],Bselect[14],Dselect[14],clk,abus,bbus);
oneWordx32bit R15(dbus,Aselect[15],Bselect[15],Dselect[15],clk,abus,bbus);
oneWordx32bit R16(dbus,Aselect[16],Bselect[16],Dselect[16],clk,abus,bbus);
oneWordx32bit R17(dbus,Aselect[17],Bselect[17],Dselect[17],clk,abus,bbus);
oneWordx32bit R18(dbus,Aselect[18],Bselect[18],Dselect[18],clk,abus,bbus);
oneWordx32bit R19(dbus,Aselect[19],Bselect[19],Dselect[19],clk,abus,bbus);
oneWordx32bit R20(dbus,Aselect[20],Bselect[20],Dselect[20],clk,abus,bbus);
oneWordx32bit R21(dbus,Aselect[21],Bselect[21],Dselect[21],clk,abus,bbus);
oneWordx32bit R22(dbus,Aselect[22],Bselect[22],Dselect[22],clk,abus,bbus);
oneWordx32bit R23(dbus,Aselect[23],Bselect[23],Dselect[23],clk,abus,bbus);
oneWordx32bit R24(dbus,Aselect[24],Bselect[24],Dselect[24],clk,abus,bbus);
oneWordx32bit R25(dbus,Aselect[25],Bselect[25],Dselect[25],clk,abus,bbus);
oneWordx32bit R26(dbus,Aselect[26],Bselect[26],Dselect[26],clk,abus,bbus);
oneWordx32bit R27(dbus,Aselect[27],Bselect[27],Dselect[27],clk,abus,bbus);
oneWordx32bit R28(dbus,Aselect[28],Bselect[28],Dselect[28],clk,abus,bbus);
oneWordx32bit R29(dbus,Aselect[29],Bselect[29],Dselect[29],clk,abus,bbus);
oneWordx32bit R30(dbus,Aselect[30],Bselect[30],Dselect[30],clk,abus,bbus);
oneWordx32bit R31(dbus,Aselect[31],Bselect[31],Dselect[31],clk,abus,bbus);

endmodule;

////////////////////////////////////////////////////////////////////////

module oneWordx32bit(dbus,Asel,Bsel,Dsel,clk,abus,bbus);

input [31:0] dbus;
input Asel, Bsel, Dsel, clk;
output [31:0] abus,bbus;

wire dbuff;
wire [31:0] out;

assign dbuff = Dsel & clk;

DFF32 DFF(dbus, dbuff, out);
TriBuffer32 ATriB(out,Asel,abus);
TriBuffer32 BTriB(out,Bsel,bbus);

endmodule

////////////////////////////////////////////////////////////////////////

module TriBuffer32(A,EN,Q);
input [31:0] A;
input EN;
output reg [31:0] Q;
always @(*)
begin
if(EN == 1'b1) Q = A;
else Q = 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
end
endmodule;




