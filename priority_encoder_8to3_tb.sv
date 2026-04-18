// Decription : Verification of a Priority Encoder 8-to-3
// Date : 31/03/2026
// Owner : Soham Sen

module priority_encoder_8to3_tb;
  
  reg inp_0,inp_1,inp_2,inp_3,inp_4,inp_5,inp_6,inp_7;
  wire [2:0] out_0;
  wire valid;
  
  // Priority Encoder 8 to 3 module instatiation
  priority_encoder_8to3 pri_enc(.inp_0(inp_0),
                                .inp_1(inp_1),
                                .inp_2(inp_2),
                                .inp_3(inp_3),
                                .inp_4(inp_4),
                                .inp_5(inp_5),
                                .inp_6(inp_6),
                                .inp_7(inp_7),
                                .out_0(out_0),
                                .valid(valid));
  
  initial begin
    
    #10;
    
    $monitor("[%0t] : {inp_7,inp_6,inp_5,inp_4,inp_3,inp_2,inp_1,inp_0} = {%b,%b,%b,%b,%b,%b,%b,%b} out_0 = 'b%b valid = 'b%b",$time,inp_7,inp_6,inp_5,inp_4,inp_3,inp_2,inp_1,inp_0,out_0,valid);
    
    // Test Pattern 1
    $display("Test Pattern 1");
    for(integer i=0;i<8;i+=1) begin
      {inp_7,inp_6,inp_5,inp_4,inp_3,inp_2,inp_1,inp_0}=1<<i;
      #10;
    end
    
    // Test Pattern 2
    $display("\nTest Pattern 2 : Randomized");
    for(integer i=0;i<8;i+=1) begin
      {inp_7,inp_6,inp_5,inp_4,inp_3,inp_2,inp_1,inp_0}=$random;
      #10;
    end
    
  end
  
  initial begin
    $dumpvars();
    $dumpfile("dump.vcd");
  end
  
endmodule
