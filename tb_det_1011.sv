// Description : Verification of Sequence Detector FSM (1011)
// Date : 03/04/2026
// Owner : Soham Sen

module tb_det_1011;
  
  reg clk,rstn;
  reg d;
  wire detected;
  
  det_1011 seq_det(.clk_inp(clk),
                   .rstn_inp(rstn),
                   .d_inp(d),
                   .detected_out(detected));
  
  always #5 clk=~clk;
  
  initial begin
    
    clk=0;
    rstn=0;
    
    #10;
    
    rstn=1;
    
    // TBD: Soham Sen 03/04/2026
    // Comment: To be removed
    /* for(integer i=0;i<100;i++) begin
      d=$random;
      #10;
    end */
    
    // Test Pattern to detected overlapping case
    d=1;
    #10 d=0;
    #10 d=1;
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #10 d=1;
    #50
    
    $finish;
  end
  
  initial begin
    $monitor("time=%0tns rstn=%0b d=%0b detected=%0b",$time,rstn,d,detected);
    // TBD: Soham Sen 03/04/2026
    // Comment: To be removed
    //$monitor("DEBUG: Current State=%0b Next State=%0b,seq_det.curr_state,seq_det.nxt_state")
  end
  
  initial begin
    $dumpvars();
    $dumpfile("tb_det_1011.vcd");
  end
  
endmodule
