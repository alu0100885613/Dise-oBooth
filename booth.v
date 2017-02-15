module booth(input wire [3:0] X, Y, output wire [7:0] S, input wire clk, start);

wire [3:0] AtoSum;
wire [3:0] MtoSum;
wire [4:0] QtoUC;
wire [3:0] SumToA;
wire resetA, cargaA, cargaQ, cargaM, desplazaA, desplazaQ, UCtoSum;

assign S = {AtoSum, QtoUC[4:1]};

regA regA1(clk,resetA,cargaA,desplazaA,SumToA,AtoSum);
regQ regQ1(X,cargaQ,desplazaQ,clk,start,AtoSum[0],QtoUC);
regM regM1(MtoSum,Y,cargaM,clk,start);
sum alu1(AtoSum,MtoSum,SumToA,UCtoSum);

uc uc1(QtoUC,start,clk,cargaQ,desplazaQ,resetA,cargaA,desplazaA,,UCtoSum,cargaM);

endmodule
