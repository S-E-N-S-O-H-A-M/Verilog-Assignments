// Description : Verification of Simple 4-bit Calculator
// Date : 04/04/2026
// Owner : Soham Sen

module calc_tb;
  
  // Signals driven to DUT
  reg clk,rstn;
  reg [1:0] opr;
  reg [3:0] a,b;
  wire [7:0] c;
  wire [6:0] segment_7_0;
  wire [6:0] segment_7_1;
  wire [6:0] segment_7_2;
  
  // DUT Initialization
  calc_4bit calc(.clk_inp(clk),
                 .rstn_inp(rstn),
                 .opr_inp(opr),
                 .a_inp(a),
                 .b_inp(b),
                 .c_out(c),
                 .segment_7_0_out(segment_7_0),
                 .segment_7_1_out(segment_7_1),
                 .segment_7_2_out(segment_7_2));
  
  
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
      opr=$random();
      a=$random();
      b=$random();
      #10;
      if(b==0) begin
        $display("Division by zero error.");
      end
    end
    $finish;
  end
  
  // Test signal monitoring
  initial begin
    $monitor("Time:%0tns rstn=%0b, opr=%b, a=%b, b=%b, c=%b , segment_7_2=%b, segment_7_1=%b, segment_7_0=%b",$time,rstn,opr,a,b,c,segment_7_2,segment_7_1,segment_7_0);
  end
  
  // Dump in waves
  initial begin
    $dumpvars();
    $dumpfile("calc_tb.vcd");
  end
  
endmodule
