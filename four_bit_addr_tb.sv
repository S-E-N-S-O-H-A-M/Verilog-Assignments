// Description : Verification of 4-bit Binary Adder
// Date : 29/03/2026
// Owner : Soham Sen
module four_bit_addr_tb;
  
  reg [3:0] a,b;
  reg cin;
  wire [3:0] sum;
  wire cout;
  
  // 4-bit binary adder instantiation
  four_bit_binary_adder four_bit_addr(.inp_a(a),
                    		  		  .inp_b(b),
                                      .inp_cin(cin),
                                      .out_sum(sum),
                                      .cout(cout));
  
  initial begin
    $display("a    | b    | carry_in | sum  | carry_out");
    $monitor("%b | %b | %0b        | %b | %0b",a,b,cin,sum,cout);
    for(integer i = 0;i<10;i+=1) begin
    	a=$urandom();
    	b=$urandom();
    	cin=$urandom();
    	#10;
 	end
    $finish;
  end
  
  initial begin
    $dumpvars();                // default "dump.vcd"
    $dumpfile("wave1.vcd");     // dumps into "wave2.vcd"
  end
  
endmodule
