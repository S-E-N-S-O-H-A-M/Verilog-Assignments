// Description : Design of 4-bit Binary Adder
// Date : 29/03/2026
// Owner : Soham Sen

// Half Adder
module half_adder(input wire inp_a,
                  input wire inp_b,
                  output wire out_sum,
                  output wire out_carry);
  
  xor xor_0(out_sum,inp_a,inp_b);
  and and_0(out_carry,inp_a,inp_b);
  
endmodule

// Full Adder
module full_adder(input wire inp_a,
                  input wire inp_b,
                  input wire inp_cin,
                  output wire out_sum,
                  output wire out_carry);
  wire ha_0_sum,ha_0_carry,ha_1_carry;
  half_adder ha_0(.inp_a(inp_a),
                  .inp_b(inp_b),
                  .out_sum(ha_0_sum),
                  .out_carry(ha_0_carry));
  half_adder ha_1(.inp_a(ha_0_sum),
                  .inp_b(inp_cin),
                  .out_sum(out_sum),
                  .out_carry(ha_1_carry));
  or or_0(out_carry,ha_0_carry,ha_1_carry);
endmodule

// 4-bit Binary Adder
module four_bit_binary_adder(input wire [3:0] inp_a,
                         input wire [3:0] inp_b,
                         input wire inp_cin,
                         output wire [3:0] out_sum,
                         output wire cout);
  wire c1,c2,c3;
  full_adder fa_0(.inp_a(inp_a[0]),
                  .inp_b(inp_b[0]),
                  .inp_cin(inp_cin),
                  .out_sum(out_sum[0]),
                  .out_carry(c1));
  full_adder fa_1(.inp_a(inp_a[1]),
                  .inp_b(inp_b[1]),
                  .inp_cin(c1),
                  .out_sum(out_sum[1]),
                  .out_carry(c2));
  full_adder fa_2(.inp_a(inp_a[2]),
                  .inp_b(inp_b[2]),
                  .inp_cin(c2),
                  .out_sum(out_sum[2]),
                  .out_carry(c3));
  full_adder fa_3(.inp_a(inp_a[3]),
                  .inp_b(inp_b[3]),
                  .inp_cin(c3),
                  .out_sum(out_sum[3]),
                  .out_carry(cout));
endmodule
