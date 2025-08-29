
module cordic (
	a,
	areset,
	c,
	clk,
	s);	

	input	[11:0]	a;
	input		areset;
	output	[7:0]	c;
	input		clk;
	output	[7:0]	s;
endmodule
