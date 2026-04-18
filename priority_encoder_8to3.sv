// Description : Design of a Priority Encoder 8-to-3
// Date : 31/03/2026
// Owner : Soham Sen

// Priority Encoder 8 to 3
module priority_encoder_8to3(input wire inp_0,
                             input wire inp_1,
                             input wire inp_2,
                             input wire inp_3,
                             input wire inp_4,
                             input wire inp_5,
                             input wire inp_6,
                             input wire inp_7,
                             output reg [2:0] out_0,
                             output reg valid);
  
  always@(*)
     begin
       if(inp_7) begin
         out_0=3'd7;
         valid=1'b1;
       end
       else if(inp_6) begin
         out_0=3'd6;
         valid=1'b1;
       end
       else if(inp_5) begin
         out_0=3'd5;
         valid=1'b1;
       end
       else if(inp_4) begin
         out_0=3'd4;
         valid=1'b1;
       end
       else if(inp_3) begin
         out_0=3'd3;
         valid=1'b1;
       end
       else if(inp_2) begin
         out_0=3'd2;
         valid=1'b1;
       end
       else if(inp_1) begin
         out_0=3'd1;
         valid=1'b1;
       end
       else if(inp_0) begin
         out_0=3'd0;
         valid=1'b1;
       end
       else begin
         out_0=3'd0;
         valid=1'b0;
       end
     end
  
endmodule
