// Testbench ejemplo

`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulación y el paso de simulación

module mimodulo_tb;


reg [3:0] x, y;
reg clk, start;
wire [7:0] salida;


booth mimodulo(x,y,salida,clk,start);

initial
begin
	clk = 1'b1;
	start = 1'b1;
	#1
	start = 1'b0;
end

always
	#5
	clk = !clk;

initial
begin
  $monitor("time=%0d x=%b y=%b salida=%b clk=%b", $time, x, y, salida, clk);
  $dumpfile("mimodulo_tb.vcd");
  $dumpvars;

x = 4'b0010;
y = 4'b0010;

#200;

  $finish;

end
endmodule
