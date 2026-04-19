// Description : Verification of D Flip-Flop Variations
// Date : 02/04/2026
// Owner : Soham Sen

module dff_tb;
  
  integer i;
  
  reg clk,rstn;
  reg d;
  reg preset,clear;
  wire q;
  
  // DUT Instantiation
  dff dff_0(.clk_inp(clk),
            .rstn_inp(rstn),
            .d_inp(d),
            .preset_inp(preset),
            .clear_inp(clear),
            .q_out(q));
  
  // Clock Generation
  initial begin
    clk=0;
    forever #5 clk = ~clk;
  end
  
  // Test Pattern
  initial begin
     
    rstn=0;
    d=0;
    
    #10;
    
    //Reset deactivated
    rstn=1;
    
    i=20;
    while(i>0) 
      begin
      	d<=$random();
        preset=$random();
        clear=$random();
      	#10;
      	i=i-1;
      end
    
    $finish;
  end
  
  // Input Output Monitoring
  initial begin
    $display("======================D Flip-Flop==========================");
    $monitor("t=%0dns clk=%0b rstn=%0b preset=%0b clear=%0b d=%0b q=%0b",$time,clk,rstn,preset,clear,d,q);
  end
  
  // Waveform 
  initial begin
    $dumpvars();
    $dumpfile("dff.vcd");
  end
  
endmodule
