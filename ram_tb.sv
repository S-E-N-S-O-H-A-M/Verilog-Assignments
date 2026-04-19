// Description : Verification of 8x8 Single Port RAM
// Date : 04/04/2026
// Owner : Soham Sen

module ram_tb;
  
  parameter WIDTH=8;
  parameter DEPTH=8;
  
  reg clk,rstn,wr_en,rd_en;
  reg [$clog2(DEPTH)-1:0]addr;
  wire [WIDTH-1:0] data;
  reg [WIDTH-1:0] tb_data;
  
  // DUT Instantiation
  ram#(.WIDTH(WIDTH),.DEPTH(DEPTH)) ram_0(.clk_inp(clk),
                                          .rstn_inp(rstn),
                                          .wr_en_inp(wr_en),
                                          .rd_en_inp(rd_en),
                                          .addr_inp(addr),
                                          .data(data));
  
  
  // Clock Generation
  always #5 clk=~clk;
  
  initial begin
    // Initialization
	clk=1;
    rstn=0;
    #10;
    rstn=1;
    // Test Pattern
    for(integer i=0;i<20;i=i+1) begin
      wr_en=$random();
      rd_en=~wr_en;
      addr=$random();
      if(wr_en) begin
        tb_data=$random();
      end
      #10;
    end
    $finish;
  end
  
  assign data=(wr_en && !rd_en)?tb_data:'hz;
  
  
  // Monitoring
  initial begin
    $monitor("Time:%0tns wr_en=%0b, rd_en=%0b, addr=%b, data=%b",$time,wr_en,rd_en,addr,data);
  end
  
  // Dump in waves
  initial begin
    $dumpvars();
    $dumpfile("ram_tb.vcd");
  end
  
endmodule
