module regM(input wire clk, ResetM, CargaM, input wire [3:0] entradaM, output wire [3:0] salidaM);

 //Si se carga o desplaza se habilitan en modificación los biestables
ffdc ff0(clk, ResetM, CargaM, entradaM[0], salidaM[0]);
ffdc ff1(clk, ResetM, CargaM, entradaM[1], salidaM[1]);
ffdc ff2(clk, ResetM, CargaM, entradaM[2], salidaM[2]);
ffdc ff3(clk, ResetM, CargaM, entradaM[3], salidaM[3]); //entra un cero en el desplaz

endmodule
