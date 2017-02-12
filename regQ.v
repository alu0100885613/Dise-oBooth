module regQ (input wire [3:0] entQ, input wire CargaQ, DesplazaQ, clk, reset, output wire [4:0] salQ , input wire fromA);

assign enable = CargaQ | DesplazaQ;

cdaff ff0(CargaQ, 1'b0, entQ[0], clk, reset, enable, salQ[0]);
cdaff ff1(CargaQ, entQ[0], entQ[1], clk, reset, enable, salQ[1]);
cdaff ff2(CargaQ, entQ[1], entQ[2], clk, reset, enable, salQ[2]);
cdaff ff3(CargaQ, entQ[2], entQ[3], clk, reset, enable, salQ[3]);
cdaff ff2(CargaQ, entQ[3], fromA , clk, reset, enable, salQ[4]);
endmodule


module cdaff (input wire selc_d, inp_c, inp_d, clk, reset, carga, output wire q);
wire inp;
ffdc ff0(clk, reset, carga, inp, q);
mux2_1_i1 mux0(inp, inp_d, inp_c, selc_d);
endmodule


module mux2_1_i1(output wire out, input wire a, b, s);

wire  s_n, sa, sb;

not inv1 (s_n, s);
and and1 (sa, a, s_n);
and and2 (sb, b, s);
or or1 (out, sa, sb);
endmodule
