// Description : Design of a 4-bit Arithemtic Logical Unit(ALU)
// Date : 31/03/2026
// Owner : Soham Sen

// 4-bit ALU
module alu_4bit(input wire [3:0] inp_0,
                input wire [3:0] inp_1,
                input wire [2:0] inp_opr,
                output reg [3:0] out_0,
                output reg zero,
               	output reg carry,
               	output reg overflow);
  
  always_comb 
    begin
      case(inp_opr) 
        // ADD
      	3'b000: begin
          			{carry,out_0} = inp_0 + inp_1;
          			overflow = carry;
          			if({carry,out_0}==0) begin
            			zero=1;
          			end
          			else begin
                      zero=0;
        			end
        		end
        // SUB
        3'b001: begin
          {carry,out_0} = inp_0 + (~inp_1 + 1'b1); // 2's Complement Substraction
          			overflow = carry;
          			if({carry,out_0}==0) begin
            			zero=1;
          			end
          			else begin
                      zero=0;
        			end
        		end
        // AND
        3'b010: begin
          			out_0 = inp_0 & inp_1;
          			carry = 0;
          			overflow = 0;
          			if(out_0==0) begin
            			zero=1;
          			end
          			else begin
                      zero=0;
        			end
        		end
        //OR
        3'b011: begin
          			out_0 = inp_0 | inp_1;
          			carry = 0;
          			overflow = 0;
          			if(out_0==0) begin
            			zero=1;
          			end
          			else begin
                      zero=0;
        			end
        		end
        // XOR
        3'b100: begin
          			out_0 = inp_0 ^ inp_1;
          			carry = 0;
          			overflow = 0;
          			if(out_0==0) begin
            			zero=1;
          			end
          			else begin
                      zero=0;
        			end
        		end
        //NOT
        3'b101: begin
          			out_0 = ~inp_0;
          			carry = 0;
          			overflow = 0;
          			if(out_0==0) begin
            			zero=1;
          			end
          			else begin
                      zero=0;
        			end
        		end
        // Shift Left
        3'b110: begin
          			out_0 = inp_0<<inp_1;
          			carry = 0;
          			overflow = 0;
          			if(out_0==0) begin
            			zero=1;
          			end
          			else begin
                      zero=0;
        			end
        		end
        // Shift Right
        3'b111: begin
          			out_0 = inp_0>>inp_1;
          			carry = 0;
          			overflow = 0;
          			if(out_0==0) begin
            			zero=1;
          			end
          			else begin
                      zero=0;
        			end
        		end
        default: begin
          			out_0=0;
          			carry=0;
          			zero=0;
          			overflow=0;
        		end
      endcase
  	end
  
endmodule
