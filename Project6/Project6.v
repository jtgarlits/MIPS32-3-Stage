module Project6(ibus,clk,abus,bbus,dbus);

output [31:0] abus,bbus,dbus;
input [31:0] ibus;
input clk;

wire [31:0] Aselect,Bselect,Dselect,Dselect1;
wire [2:0] S;
wire Imm,Cin;

wire [31:0] bus,rs,rt,rd,signex32,sign2ex32;
wire I,Cin1;
wire [2:0] Sel;

wire [31:0] a1bus,b1bus,d1bus,a2bus,b2bus,d2bus,bbusout;
wire Cout,V;

/////////////////////////////////////////////////////
//////////// ///Start of Program ////////////////////
/////////////////////////////////////////////////////


///////////////////////IF/ID/////////////////////////
DFF32 IF(ibus,clk,bus);
/////////////////////////////////////////////////////


Decoder rs_decode(bus[25:21],rs);
Decoder rt_decode(bus[20:16],rt);
Decoder rd_decode(bus[15:11],rd);
Opcode op_decode(bus,I,Sel,Cin1);

RegisterFile register(Aselect,Bselect,Dselect,clk,a1bus,b1bus,d1bus);

assign Aselect = rs;
assign Bselect = rt;
Mux21 MuxDSel(rd,rt,I,Dselect1);

SignEx SExt(bus[15:0],signex32);


///////////////////////ID/EX//////////////////////////
DFF32 DFFABus(a1bus,clk,abus);
DFF32 DFFBBus(b1bus,clk,b2bus);
DFF32 DFFSignEx(signex32,clk,sign2ex32);
DFF3 SOut(Sel,clk,S);
DFF ImmOut(I,clk,Imm);
DFF CinOut(Cin1,clk,Cin);
/////////////////////////////////////////////////////


Mux21 MuxBBus(b2bus,sign2ex32,Imm,bbus);

ALU ALU0(abus,bbus,d2bus,S,V,Cin,Cout);


//////////////////////EX/MEM/////////////////////////
DFF32 DSelFF(Dselect1,clk,Dselect);
DFF32 DBusFF(d2bus,clk,dbus);
/////////////////////////////////////////////////////


assign d1bus = dbus;


endmodule
