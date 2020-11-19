module sequence_fsm_tb;
	reg data_in,clk,rst,a,b;
	wire out;
	
  sequence_fsm fsm1(clk, rst,data_in, out);
	initial 
      begin 
        $dumpfile("wv.vcd");
        $dumpvars();
      end
  
    initial 
      begin 
  	  data_in = 0;
          clk = 0;
          rst = 1;
          #20 rst = 0;
      end
  
    always
 	  begin 	   
        #10 clk=~clk;
      end
  
   initial 
     begin 
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 1; 
       
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 0;
       
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 0;
       
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 0;
        
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 1;
       
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 0;
       
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 1;

        #500;
        $finish;
      end
endmodule