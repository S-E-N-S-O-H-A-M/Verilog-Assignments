// Description : Simple 4-bit Calculator Design
// Date : 04/04/2026
// Owner : Soham Sen

// 4bit Simple Calculator
module calc_4bit(input wire clk_inp,
                 input wire rstn_inp,
                 input wire[1:0] opr_inp,
                 input wire [3:0] a_inp,
                 input wire [3:0] b_inp,
                 output wire [7:0] c_out,
                 output wire [6:0] segment_7_0_out,
                 output wire [6:0] segment_7_1_out,
                 output wire [6:0] segment_7_2_out);
  
  reg [3:0] reg_a,reg_b;
  reg [7:0] calc_out;
  reg [3:0] calc_out_0;
  reg [3:0] calc_out_1;
  reg [3:0] calc_out_2;
  reg [7:0] temp_reg;
  
  // Load Inputs
  always@(posedge clk_inp)
    begin
      if(!rstn_inp) begin
        reg_a<=0;
        reg_b<=0;
      end
      else begin
        reg_a<=a_inp;
        reg_b<=b_inp;
      end
    end
  
  always_comb
    begin
      case(opr_inp)
        2'b00: calc_out<=reg_a+reg_b; // ADD
        2'b01: calc_out<=reg_a+(~reg_b)+1; // SUB
        2'b10: calc_out<=reg_a*reg_b; // MULT
        2'b11: begin // DIV
          		if(reg_b!=0) begin
                   calc_out<=reg_a/reg_b;
                 end
                 else begin
                   calc_out<='hz;
          		 end
               end
        default: calc_out=0;
      endcase
    end
          
   assign c_out=calc_out;
  
   // Logic for storing individual bits of the calculated result  
   always_comb
     begin
       if(calc_out<'d10) begin
         calc_out_0=calc_out;
         calc_out_1=0;
         calc_out_2=0;
       end
       else if((calc_out>='d10) && (calc_out<'d99)) begin
         for(integer i=0;i<2;i=i+1) begin
           if(i==0) begin
             calc_out_0=calc_out%10;
             temp_reg=calc_out/10;
           end
           else begin
             calc_out_1=temp_reg%10;
           end
         end  
         calc_out_2=0;
       end
       else if(calc_out>'d99) begin
         for(integer i=0;i<3;i=i+1) begin
           if(i==0) begin
             calc_out_0=calc_out%10;
             temp_reg=calc_out/10;
           end
           else if(i==1) begin
             calc_out_1=temp_reg%10;
             temp_reg=temp_reg/10;
           end
           else begin
             calc_out_2=temp_reg%10;
           end
         end 
       end
     end
   
  bcd_7segment_display u0(.bcd_inp(calc_out_2),.segment7_out(segment_7_2_out));
  bcd_7segment_display u1(.bcd_inp(calc_out_1),.segment7_out(segment_7_1_out));
  bcd_7segment_display u2(.bcd_inp(calc_out_0),.segment7_out(segment_7_0_out));
  
endmodule

// BCD to 7 segment Display Coverter
module bcd_7segment_display(input wire [3:0] bcd_inp,
                            output reg [6:0] segment7_out);
    
  always_comb
    begin
      case(bcd_inp)
        4'b0000: segment7_out<=7'b0111111; // 0
        4'b0001: segment7_out<=7'b0000110; // 1
        4'b0010: segment7_out<=7'b1011011; // 2
        4'b0011: segment7_out<=7'b1001111; // 3
        4'b0100: segment7_out<=7'b1100110; // 4
        4'b0101: segment7_out<=7'b1101101; // 5
        4'b0110: segment7_out<=7'b1111101; // 6
        4'b0111: segment7_out<=7'b0000111; // 7
        4'b1000: segment7_out<=7'b1111111; // 8
        4'b1001: segment7_out<=7'b1100111; // 9
        default: segment7_out<=7'b0000000; // 0
      endcase
    end
  
endmodule
