// Description : Design of 2to4 Decoder with Enable
// Date : 29/03/2026
// Owner : Soham Sen

// 2to4 Decoder with Enable
module decoder_2to4(input wire [1:0] inp,
					input wire en,
                    output wire [3:0] out);
  
  reg [3:0] temp_out;
  
  always@(*)
    begin
      case(inp)
        2'b00 : temp_out = 4'b0001;  
        2'b01 : temp_out = 4'b0010;  
        2'b10 : temp_out = 4'b0100;  
        2'b11 : temp_out = 4'b1000;  
      endcase
    end
  
  assign out = en ? temp_out : 4'b0000;
endmodule
