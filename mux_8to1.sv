// Description : Design of a 8-to-1 Multiplexer
// Date : 31/03/2026
// Owner : Soham Sen

// 2-to-1 Multiplexer
module mux_2to1 #(parameter WIDTH=2)(input wire [WIDTH-1:0] inp_0,
                                     input wire [WIDTH-1:0] inp_1,
                                     input wire sel,
                                     output wire [WIDTH-1:0] out_0);
  // Data Flow Modelling using Ternary conditional Operator
  assign out_0 = sel ? inp_1 : inp_0;
endmodule

// 8-to-1 Multiplexer
module mux_8to1 #(parameter WIDTH=2)(input wire [WIDTH-1:0] inp_0,
                                     input wire [WIDTH-1:0] inp_1,
                                     input wire [WIDTH-1:0] inp_2,
                                     input wire [WIDTH-1:0] inp_3,
                                     input wire [WIDTH-1:0] inp_4,
                                     input wire [WIDTH-1:0] inp_5,
                                     input wire [WIDTH-1:0] inp_6,
                                     input wire [WIDTH-1:0] inp_7,
                                     input wire [2:0] inp_sel,
                                     output reg [WIDTH-1:0] out_0);
  
  
`ifdef BEHAV_MOD  
  
  // Behavioral modelling using case statement
  always_comb 
    begin
      case(inp_sel)
        3'b000 : out_0 = inp_0;
        3'b001 : out_0 = inp_1;
        3'b010 : out_0 = inp_2;
        3'b011 : out_0 = inp_3;
        3'b100 : out_0 = inp_4;
        3'b101 : out_0 = inp_5;
        3'b110 : out_0 = inp_6;
        3'b111 : out_0 = inp_7;
        default : out_0 = {WIDTH{1'bx}};
      endcase
  	end

`else
  
  // Using 2-to-1 Mutiplexer
  
  // local net declarations
  wire [WIDTH-1:0] out_stg0_mux0,out_stg0_mux1,out_stg0_mux2,out_stg0_mux3;
  wire [WIDTH-1:0] out_stg1_mux0,out_stg1_mux1;
  wire [WIDTH-1:0] out_stg3_mux0;
  
  mux_2to1 #(WIDTH) stg0_mux0(.inp_0(inp_0),.inp_1(inp_1),.sel(inp_sel[0]),.out_0(out_stg0_mux0));
  mux_2to1 #(WIDTH) stg0_mux1(.inp_0(inp_2),.inp_1(inp_3),.sel(inp_sel[0]),.out_0(out_stg0_mux1));
  mux_2to1 #(WIDTH) stg0_mux2(.inp_0(inp_4),.inp_1(inp_5),.sel(inp_sel[0]),.out_0(out_stg0_mux2));
  mux_2to1 #(WIDTH) stg0_mux3(.inp_0(inp_6),.inp_1(inp_7),.sel(inp_sel[0]),.out_0(out_stg0_mux3));
  mux_2to1 #(WIDTH) stg1_mux0(.inp_0(out_stg0_mux0),.inp_1(out_stg0_mux1),.sel(inp_sel[1]),.out_0(out_stg1_mux0));
  mux_2to1 #(WIDTH) stg1_mux1(.inp_0(out_stg0_mux2),.inp_1(out_stg0_mux3),.sel(inp_sel[1]),.out_0(out_stg1_mux1));
  mux_2to1 #(WIDTH) stg2_mux0(.inp_0(out_stg1_mux0),.inp_1(out_stg1_mux1),.sel(inp_sel[2]),.out_0(out_stg3_mux0));
  
  assign out_0 = out_stg3_mux0;
  
`endif
  
endmodule
