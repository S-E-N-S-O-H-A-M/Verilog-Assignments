// Description : 8x8 Single Port RAM Design
// Date : 04/04/2026
// Owner : Soham Sen


module ram#(parameter WIDTH=8, parameter DEPTH=8)
           (input wire clk_inp,
            input wire rstn_inp,
            input wire wr_en_inp,
            input wire rd_en_inp,
            input wire [$clog2(DEPTH)-1:0] addr_inp,
            inout wire [WIDTH-1:0] data);
  
  reg [WIDTH-1:0] mem[DEPTH];
  reg [WIDTH-1:0] temp;
  
  always@(posedge clk_inp)
    begin
      // Initialize the RAM with zeros/known state
      if(!rstn_inp) begin
        for(integer i=0;i<DEPTH;i=i+1) begin
          mem[i]<=0;
        end
      end
      else begin
        // Write Operation
        if(wr_en_inp && !rd_en_inp) begin
          mem[addr_inp]<=data;
        end
        // Read Operation
        else if(!wr_en_inp && rd_en_inp) begin
          temp<=mem[addr_inp];
        end
      end
    end
  
  assign data=(rd_en_inp && !wr_en_inp)?temp:'hz;
  
endmodule
