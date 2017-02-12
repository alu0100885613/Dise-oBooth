module regA(input wire clk, ResetA, CargaA, DesplazaA, input wire [3:0] entA, output wire [3:0] salA, output wire toQ);

assign enable = CargaA | DesplazaA;

cdaff ffa0(CargaA, entA[0], entA[1], clk, reset, enable, salA[0]);
cdaff ffa1(CargaA, entA[1], entA[2], clk, reset, enable, salA[1]);
cdaff ffa2(CargaA, entA[2], entA[3], clk, reset, enable, salA[2]);
cdaff ffa3(CargaA, entA[3], entA[3], clk, reset, enable, salA[3]);

if(DesplazaA)
	toQ <= entA[0];

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

endmodule
