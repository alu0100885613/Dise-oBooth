module uc(input wire [4:0] q01, input wire start, clk, output wire CargaQ, DesplazaQ, ResetA, CargaA, DesplazaA, Fin, Op,CargaM);
reg [3:0] state, nextstate; 

parameter S0 = 4'b0000;
parameter S1 = 4'b0001;
parameter S2 = 4'b0010;
parameter S3 = 4'b0011;
parameter S4 = 4'b0100;
parameter S5 = 4'b0101;
parameter S6 = 4'b0110;
parameter S7 = 4'b0111;
parameter S8 = 4'b1000;
parameter S9 = 4'b1001;


always @ (posedge clk, posedge start)
if (start)
state <= S0;
else
state <= nextstate;

always @(*)
case (state)
S0: nextstate = S1;
S1: nextstate = S2;
S2: nextstate = S3;
S3: nextstate = S4;
S4: nextstate = S5;
S5: nextstate = S6;
S6: nextstate = S7;
S7: nextstate = S8;
S8: nextstate = S9;
S9: nextstate = S9;
default: nextstate = S0;
endcase



assign CargaQ = (state == S0)? 1:0;
assign ResetA = CargaQ;
assign CargaM = CargaQ;
assign DesplazaQ = ((state == S2)|(state == S4)|(state == S6)|(state == S8))? 1:0;
assign DesplazaA = DesplazaQ;
assign CargaA = ((q01[0]^q01[1]) & ((state == S1)|(state == S3)|(state == S5)|(state == S7)))? 1:0;
assign Fin = (state == S9)? 1:0;
assign Op = ((q01[0] == 0) & (q01[1] == 1))? 1:0;


endmodule
