module sum(input wire [3:0] A, M, output reg [3:0] Q, input wire Op);

always @(A or M or Op)
if (Op)
	Q <= A-M;
else
	if(!Op)
		Q <= A+M;

endmodule
