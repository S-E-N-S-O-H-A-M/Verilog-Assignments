// Description : Sequence Detector FSM (1011) Design
// Date : 03/04/2026
// Owner : Soham Sen

module det_1011(input wire d_inp,
                input wire clk_inp,
                input wire rstn_inp,
                output wire detected_out);
  
  // FSM States(MEALY)
  localparam IDLE     = 3'b000;
  localparam DET_10   = 3'b001;
  localparam DET_101  = 3'b010;
  localparam DET_1011 = 3'b011;
  
  // FSM States(MOORE)
  localparam S0 = 3'b000;
  localparam S1 = 3'b001;
  localparam S2 = 3'b010;
  localparam S3 = 3'b011;
  localparam S4 = 3'b100;
  
  // State
  reg [2:0] curr_state,nxt_state;
  
  reg temp_det;

  // MOORE
`ifdef MOORE

`ifdef NON_OVERLAP
  // Non-Overlapping
  // Combinational 
  always_comb
    begin
      case(curr_state)
        S0:  begin
          		if(d_inp) begin
                  nxt_state<=S1;
          		end
         		else begin
                  nxt_state<=IDLE;
                end
        	   end
        S1: begin
          		if(!d_inp) begin
                  nxt_state<=S2;
          		end
         		else begin
                  nxt_state<=S1;
                end
        	   end
        S2: begin
          		 if(d_inp) begin
                    nxt_state<=S3;
          		  end
         		  else begin
                    nxt_state<=S1;
                  end
        		end
        S3: begin
          		 if(d_inp) begin
                    nxt_state<=S4;
          		  end
         		  else begin
                    nxt_state<=S2;
                  end
        		end
        S4: begin
              nxt_state<=IDLE;
              temp_det<=1;
             end
        default: begin
          			nxt_state<=IDLE;
          			temp_det<=0;
          		 end
      endcase
    end
 
`else 
  
  // Overlapping
  // Combinational 
  always_comb
    begin
      case(curr_state)
        S0:  begin
          		if(d_inp) begin
                  nxt_state<=S1;
          		end
         		else begin
                  nxt_state<=IDLE;
                end
        	   end
        S1: begin
          		if(!d_inp) begin
                  nxt_state<=S2;
          		end
         		else begin
                  nxt_state<=S1;
                end
        	   end
        S2: begin
          		 if(d_inp) begin
                    nxt_state<=S3;
          		  end
         		  else begin
                    nxt_state<=S1;
                  end
        		end
        S3: begin
         	 	  if(d_inp) begin
                    nxt_state<=S4;
                    temp_det<=1;
          		  end
         		  else begin
                    nxt_state<=S2;
                    temp_det<=0;
                  end
        		 end
        S4: begin
         	 	  if(d_inp) begin
                    nxt_state<=S1;
                    temp_det<=1;
          		  end
         		  else begin
                    nxt_state<=S2;
                    temp_det<=0;
                  end
        		 end
        default: begin
          			nxt_state<=IDLE;
          			temp_det<=0;
          		 end
      endcase
    end
`endif  
	assign detected_out = (curr_state==S4)?temp_det:0; 
  
// MEALY
`else  
`ifdef NON_OVERLAP
  // Non-Overlapping
  // Combinational 
  always_comb
    begin
      case(curr_state)
        IDLE:  begin
          		if(d_inp) begin
                  nxt_state<=DET_10;
          		end
         		else begin
                  nxt_state<=IDLE;
                end
        	   end
        DET_10: begin
          		if(!d_inp) begin
                  nxt_state<=DET_101;
          		end
         		else begin
                  nxt_state<=DET_10;
                end
        	   end
        DET_101: begin
          		 if(d_inp) begin
                    nxt_state<=DET_1011;
          		  end
         		  else begin
                    nxt_state<=IDLE;
                  end
        		end
        DET_1011: begin
         	 	  if(d_inp) begin
                    nxt_state<=IDLE;
                    temp_det<=1;
          		  end
         		  else begin
                    nxt_state<=IDLE;
                    temp_det<=0;
                  end
        		 end
        default: begin
          			nxt_state<=IDLE;
          			temp_det<=0;
          		 end
      endcase
    end
 
`else 
  
  // Overlapping
  // Combinational 
  always_comb
    begin
      case(curr_state)
        IDLE:  begin
          		if(d_inp) begin
                  nxt_state<=DET_10;
          		end
         		else begin
                  nxt_state<=IDLE;
                end
        	   end
        DET_10: begin
          		if(!d_inp) begin
                  nxt_state<=DET_101;
          		end
         		else begin
                  nxt_state<=DET_10;
                end
        	   end
        DET_101: begin
          		 if(d_inp) begin
                    nxt_state<=DET_1011;
          		  end
         		  else begin
                    nxt_state<=IDLE;
                  end
        		end
        DET_1011: begin
         	 	  if(d_inp) begin
                    nxt_state<=DET_10;
                    temp_det<=1;
          		  end
         		  else begin
                    nxt_state<=DET_101;
                    temp_det<=0;
                  end
        		 end
        default: begin
          			nxt_state<=IDLE;
          			temp_det<=0;
          		 end
      endcase
    end
`endif 
 	assign detected_out = (curr_state==DET_1011)?temp_det:0;
`endif
  
  // Sequential 
  always@(posedge clk_inp or negedge rstn_inp)
    begin
      if(!rstn_inp) begin
        curr_state<=IDLE;
      end
      else begin
        curr_state<=nxt_state;
      end
    end
  
  
  
endmodule
