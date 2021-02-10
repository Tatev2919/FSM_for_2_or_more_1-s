module sequence_fsm_tb;
	reg data_in,clk,rst;
	wire out;
	
sequence_fsm fsm1 (clk, rst,data_in, out);

initial begin 
	$dumpfile("v.vcd");
	$dumpvars();
end
  
initial begin 
	data_in = 1'b0;
	clk = 1'b0;
	rst = 1'b1;
	#20 rst = 1'b0;
end
  
always #10 clk=~clk;
  
initial begin 
	@(posedge clk) data_in <= 1'b1;
	@(posedge clk) data_in <= 1'b0;
	@(posedge clk) data_in <= 1'b1; 

	@(posedge clk) data_in <= 1'b0;
	@(posedge clk) data_in <= 1'b1;
	@(posedge clk) data_in <= 1'b0;

	@(posedge clk) data_in <= 1'b1;
	@(posedge clk) data_in <= 1'b0;
	@(posedge clk) data_in <= 1'b0;

	@(posedge clk) data_in <= 1'b0;
	@(posedge clk) data_in <= 1'b0;
	@(posedge clk) data_in <= 1'b0;

	@(posedge clk) data_in <= 1'b0;
	@(posedge clk) data_in <= 1'b0;
	@(posedge clk) data_in <= 1'b1;

	@(posedge clk) data_in <= 1'b0;
	@(posedge clk) data_in <= 1'b1;
	@(posedge clk) data_in <= 1'b0;

	@(posedge clk) data_in <= 1'b1;
	@(posedge clk) data_in <= 1'b0;
	@(posedge clk) data_in <= 1'b1;
	@(posedge clk) data_in <= 1'b1;

	#500;
	$finish;
end
endmodule
