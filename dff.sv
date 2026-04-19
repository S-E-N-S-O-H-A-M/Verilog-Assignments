// Description : D Flip-Flop Variations Design
// Date : 02/04/2026
// Owner : Soham Sen

module dff(input wire clk_inp,
           input wire rstn_inp,
           input wire d_inp,
           input wire preset_inp,
           input wire clear_inp,
           output reg q_out);
  
`ifdef BASIC_DFF
  // Basic D FF
  always_ff@(posedge clk_inp)
  	q_out<=d_inp

 `elsif SYNC_DFF
  // D FF with asynchronous reset
  always_ff@(posedge clk_inp)
    begin
      if(!rstn_inp) begin
        q_out<=0;
      end
      else begin
        q_out<=d_inp;
      end
    end
  
 `elsif ASYNC_DFF
  // D FF with synchronous reset
  always_ff@(posedge clk_inp or negedge rstn_inp)
    begin
      if(!rstn_inp) begin
        q_out<=0;
      end
      else begin
        q_out<=d_inp;
      end
    end

`else
  // D FF with preset and clear
  always_ff@(posedge clk_inp or negedge rstn_inp)
    begin
      if(!rstn_inp) begin
        q_out<=0;
      end
      else begin
        if(preset_inp) begin
          q_out<=1;
        end
        else if(clear_inp) begin
          q_out<=0;
        end
        else begin
          q_out<=d_inp;
        end
      end
    end

`endif ; // This semicolon needed with Synopsys VCS Simulator. Working without this also in Cadence Xcelium
  
endmodule
