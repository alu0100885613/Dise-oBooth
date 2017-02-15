module regA(input wire clk, reset, CargaA, DesplazaA, input wire [3:0] entA, output wire [3:0] q);

assign enable = CargaA | DesplazaA;

cdaff ff0(CargaA, entA[1], entA[0], clk, reset, enable, q[0]);
cdaff ff1(CargaA, entA[2], entA[1], clk, reset, enable, q[1]);
cdaff ff2(CargaA, entA[3], entA[2], clk, reset, enable, q[2]);
cdaff ff3(CargaA, entA[3], entA[3], clk, reset, enable, q[3]);


endmodule


module cdaff (input wire selc_d, inp_d, inp_c, clk, reset, carga, output wire q);
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
