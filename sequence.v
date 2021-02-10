module sequence_fsm (clk,rst,data_in,out);
	input clk,rst,data_in;
	output reg out;
 
	parameter IDLE = 2'b0,
		  S1 = 2'b1,
		  S2 = 2'b10,
		  S3 = 2'b11;
 
 
reg [1:0] state , next_state;

always @(posedge clk)
	if (rst)  
		state <= IDLE;
	else  
		state <= next_state;
  

always @(state or data_in) 
	case (state) 
		IDLE:
		if(data_in == 1'b1) 
			next_state = S1; 	 
		else 
			next_state = state;
		S1: 
			if(data_in == 1'b0 )
				next_state = S2;

			else 
				next_state = S3;
 
		S2:
      			if(data_in == 1'b1) 
				next_state = S1;
			else 
         			next_state = IDLE;
         
		S3:
			if (data_in == 1'b0)
          			next_state = S2;
        		else 
         			next_state = state;
		default: 
         		next_state  = IDLE;
	endcase
        
  
always @(posedge clk)
	case (state)
		IDLE: out = 1'b0;
		S1: 
			if (data_in == 1'b0)
				out = 1'b0;
			else 
				out = 1'b1;
		S2: 
			if (data_in == 1'b1)
				out = 1'b1;
			else 
				out = 1'b0;
		S3:
			out = 1'b1;
		default:
			out = 1'b0;
	endcase

endmodule
