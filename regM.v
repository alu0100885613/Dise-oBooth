module regM(input wire clk, ResetM, CargaM, input wire [3:0] entradaM, output wire [3:0] salidaM);

 //Si se carga o desplaza se habilitan en modificación los biestables
ffdc ffm0(clk, ResetM, CargaM, entradaM[0], salidaM[0]);
ffdc ffm1(clk, ResetM, CargaM, entradaM[1], salidaM[1]);
ffdc ffm2(clk, ResetM, CargaM, entradaM[2], salidaM[2]);
ffdc ffm3(clk, ResetM, CargaM, entradaM[3], salidaM[3]); //entra un cero en el desplaz

endmodule
