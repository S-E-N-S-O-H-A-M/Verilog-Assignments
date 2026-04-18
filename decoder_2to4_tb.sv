// Description : Verification of Design of 2to4 Decoder with Enable
// Date : 29/03/2026
// Owner : Soham Sen

module decoder_2to4_tb;
  
  reg [1:0] inp;
  reg en;
  wire [3:0] out;
  
  // Decoder instantiation
  decoder_2to4 dec(.inp(inp),
                   .en(en),
                   .out(out));
  
  initial begin
    $display("inp  | en | out");
    $monitor("%b | %0b | %b",inp,en,out);
    for(integer i=0;i<4;i+=1) begin
      inp=i;
      en=$urandom();
      #10;
    end
  end
  
  initial begin
    $dumpvars();                // default "dump.vcd"
    $dumpfile("wave1.vcd");     // dumps into "wave1.vcd"
  end
  
endmodule
