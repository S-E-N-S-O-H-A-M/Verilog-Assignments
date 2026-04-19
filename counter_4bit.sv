// Description : 4-bit Up/Down Counter with Load Design
// Date : 03/04/2026
// Owner : Soham Sen

module counter_4bit(input wire clk_inp,
                    input wire rstn_inp,
                    input wire [3:0] data_inp,
                    input wire en_inp,
                    input wire [1:0] opr_inp,
                    output reg [3:0] data_out
					);
  
  reg [3:0] temp;
  
  // Synchronous reset
  always_ff@(posedge clk_inp)
    begin
      if(!rstn_inp) begin
        temp<=0;
      end
      else begin
        if(en_inp) begin
          case(opr_inp)
            2'b00 : temp<=temp+1; // Up count 
            2'b01 : begin
                      if(temp!=0) begin
              			temp<=temp-1; // Down count
              		  end
            		end
            2'b10 : temp<=data_inp;   // Parallel Load
            default : temp<=temp; // Hold
          endcase
        end
      end
    end
  
   assign data_out=temp;
  
endmodule
