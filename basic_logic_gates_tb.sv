// Description : Verification of Basic Logic Gates
// Date : 29/03/2026
// Owner : Soham Sen
module basic_logic_gates_tb;
  
  reg a,b;
  wire and_c,or_c,nand_c,not_c,nor_c,xor_c,xnor_c;
  
  // Logic gates instantiations
  and_gate and_0(.inp_a(a),
                 .inp_b(b),
                 .out_c(and_c));
  or_gate or_0(.inp_a(a),
               .inp_b(b),
               .out_c(or_c));
  nand_gate nand_0(.inp_a(a),
                   .inp_b(b),
                   .out_c(nand_c));
  not_gate not_0(.inp_a(a),
                 .out_c(not_c));
  nor_gate nor_0(.inp_a(a),
                 .inp_b(b),
                 .out_c(nor_c));
  xor_gate xor_0(.inp_a(a),
                 .inp_b(b),
                 .out_c(xor_c));
  xnor_gate xnor_0(.inp_a(a),
                   .inp_b(b),
                   .out_c(xnor_c));
  
  initial begin
    $display("time | a | b | and | or | nand_c | not_c | nor_c | xor_c | xnor_c");
    $display("------------------------------------------------------------------");
    $monitor("%0t   | %0b | %0b |   %0b |  %0b |      %0b |     %0b |     %0b |     %0b |      %0b",
              $time,a,b,and_c,or_c,nand_c,not_c,nor_c,xor_c,xnor_c);
    // Test Pattern 1
    a=0;
    b=0;
    #10;
    // Test Pattern 2
    a=0;
    b=1;
    #10;
    // Test Pattern 3
    a=1;
    b=0;
    #0;
    // Test Pattern 4
    a=1;
    b=1;
    #10;
    $finish;
  end
  
  initial begin
    $dumpvars();                // default "dump.vcd"
    $dumpfile("wave3.vcd");     // dumps into "wave3.vcd"
  end
  
endmodule
