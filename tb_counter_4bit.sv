// Description : Verification of 4-bit Up/Down Counter with Load
// Date : 03/04/2026
// Owner : Soham Sen

module tb_counter_4bit;
  
  reg clk,rstn;
  reg [3:0] d;
  reg en;
  reg [1:0]opr;
  wire [3:0] out; 
  
  // DUT instatntiation
  counter_4bit cntr(.clk_inp(clk),
                    .rstn_inp(rstn),
                    .data_inp(d),
                    .en_inp(en),
                    .opr_inp(opr),
                    .data_out(out));
  
  // Clock Generation
  always #5 clk=~clk;
  
  initial begin
    
    clk=0;
    rstn=0;
    d=0;
    en=0;
    opr=0;
    
    #10;
    
    rstn=1;
    
    for(integer i=0;i<10;i=i+1) begin
      d=$random;
      en=$random;
      opr=$random;
      #10;
    end
    
    $finish;
    
  end
  
  initial begin
    $display("================================4-bit Counter===============================\n");
    $monitor("t=%0t clk=%0b rstn=%0b d=%b en=%0b opr=%b out=%b",$time,clk,rstn,d,en,opr,out);
  end
  
  initial begin
    $dumpvars();
    $dumpfile("counter_4bit.vcd");
  end
  
endmodule
