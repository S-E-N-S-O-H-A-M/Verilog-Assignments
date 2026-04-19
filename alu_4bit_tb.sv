// Decription : Verification of a 8-to-1 Multiplexer
// Date : 31/03/2026
// Owner : Soham Sen

module alu_4bit_tb;
  
  reg [3:0] inp_0,inp_1;
  reg [2:0] inp_opr;
  wire [3:0] out_0;
  wire zero;
  wire carry;
  wire overflow;
  
  alu_4bit alu(.inp_0(inp_0),
               .inp_1(inp_1),
               .inp_opr(inp_opr),
               .out_0(out_0),
               .zero(zero),
               .carry(carry),
               .overflow(overflow));
  
  initial begin
    
    #10;
    
    // Monitor the input and outputs  
    $monitor("[%0t] | %b  | %b  | %b     | %b  | %b    | %b     | %b    ",$time,inp_0,inp_1,inp_opr,out_0,zero,carry,overflow);
    
    // Test Patterns
    for(integer i=0;i<10;i+=1) begin
      $display("\nTest Pattern %0d",i);
      $display("Time | inp_0 | inp_1 | inp_opr | out_0 | zero | carry | overflow");
      $display("----------------------------------------------------------------");
      inp_0=$random;
      inp_1=$random;
      for(integer j=0;j<8;j+=1) begin
        inp_opr=j;
      	#10;
      end
    end
    
  end
  
  initial begin
  	$dumpvars();
  	$dumpfile("wave.vcd");
  end
  
endmodule
