// Description : Design of Basic Logic Gates
// Date : 29/03/2026
// Owner : Soham Sen

// 2 input and gate
module and_gate(input inp_a,
                input inp_b,
                output wire out_c);
  
  assign out_c =inp_a * inp_b;
  
endmodule 

// 2 input or gate
module or_gate(input wire inp_a,
               input wire inp_b,
               output wire out_c);
  
  assign out_c = inp_a | inp_b;
  
endmodule

// 2 input nand gate
module nand_gate(input wire inp_a,
               input wire inp_b,
               output wire out_c);
  
  assign out_c = ~(inp_a * inp_b);
  
endmodule

// 2 input not gate
module not_gate(input wire inp_a,
               output wire out_c);
  
  assign out_c = ~inp_a;
  
endmodule

// 2 input nor gate
module nor_gate(input wire inp_a,
               input wire inp_b,
               output wire out_c);
  
  assign out_c = ~(inp_a | inp_b);
  
endmodule

// 2 input xor gate
module xor_gate(input wire inp_a,
               input wire inp_b,
               output wire out_c);
  
  assign out_c = inp_a ^ inp_b;
  
endmodule

// 2 input xnor gate
module xnor_gate(input wire inp_a,
                 input wire inp_b,
                 output wire out_c);
  
  assign out_c = inp_a ~^ inp_b;
  
endmodule

