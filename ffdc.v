module ffdc #(parameter retardo = 1)(input wire clk, reset, carga, d, output reg q);

always @(posedge clk, posedge reset)
  if (reset)
    q <= #retardo 1'b0;
  else
    if (carga)
      q <= #retardo d; 
endmodule
