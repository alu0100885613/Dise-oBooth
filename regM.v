 module regM(output wire [3:0] salM ,input wire  [3:0] entM , input wire cargaM , clk, reset);


ffdc ff0(clk , reset, cargaM, entM[0], salM[0]);
ffdc ff1(clk , reset, cargaM,  entM[1], salM[1]);
ffdc ff2(clk , reset, cargaM,  entM[2], salM[2]);
ffdc ff3(clk , reset, cargaM, entM[3], salM[3]);

endmodule
