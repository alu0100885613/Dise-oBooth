module regQ (input wire [3:0] entQ, input wire CargaQ, DesplazaQ, clk, reset, fromA, output wire [4:0] q);


assign enable = CargaQ | DesplazaQ;
cdaff ff0(CargaQ, q[1], 1'b0, clk, reset, enable, q[0]);
cdaff ff1(CargaQ, q[2], entQ[0], clk, reset, enable, q[1]);
cdaff ff2(CargaQ, q[3], entQ[1], clk, reset, enable, q[2]);
cdaff ff3(CargaQ, q[4], entQ[2], clk, reset, enable, q[3]);
cdaff ff4(CargaQ, fromA, entQ[3], clk, reset, enable, q[4]);

endmodule
