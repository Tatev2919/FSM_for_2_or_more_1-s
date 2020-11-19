module sequence_fsm (
    input clk,
    input rst,
    input data_in,
    output reg out
);
  parameter IDLE = 2'b00;
  parameter s1 = 2'b01;
  parameter s2 = 2'b10;
  parameter s3 = 2'b11;
 
 
  reg [1:0] state , next_state;

  always @(posedge clk)
	begin
      if (rst) begin 
          state <= IDLE;
        end
      else begin 
   	  state <= next_state;
      end
    end
  
  always @ (state or data_in)
        begin 
          case (state) 
           IDLE:
             if(data_in == 1'b1) 
             begin
            	next_state = s1; 	
             end 
            else 
              next_state = state;
            s1: 
              if(data_in == 1'b0 )
                begin 
                    next_state = s2;
                end
               else 
                 begin 
                    next_state = s3;
                 end 
            s2:
              if(data_in == 1'b1) 
                begin 
                    next_state = s1;
                end
              else 
                  begin 
                      next_state = IDLE;
                  end
             s3:
               if (data_in == 1'b0)
                 begin 
                     next_state = s2;
                 end
               else 
                 begin 
                     next_state = state;
                 end
            default: 
                 next_state  = IDLE;
          endcase
        end
  
  always @(data_in or state)
    begin
      case (state)
        IDLE: out = 0;
        s1: 
          if (data_in == 0)
            out = 0;
          else 
            out = 1;
        s2: 
          if (data_in == 1)
            out = 1;
          else 
            out = 0;
        s3:
          out = 1;
        default:
          out = 0;
      endcase
    end

endmodule