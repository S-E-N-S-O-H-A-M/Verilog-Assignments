// Decription : Verification of a 8-to-1 Multiplexer
// Date : 31/03/2026
// Owner : Soham Sen

module mux_8to1_tb;
  
  localparam WIDTH = 4;
  
  reg [WIDTH-1:0] inp_0,inp_1,inp_2,inp_3,inp_4,inp_5,inp_6,inp_7;
  reg [2:0] sel;
  wire [WIDTH-1:0] out_0;
  
  // 8-to-1 Multiplexer Instation
  mux_8to1 #(4) mux(.inp_0(inp_0),
                    .inp_1(inp_1),
                    .inp_2(inp_2),
                    .inp_3(inp_3),
                    .inp_4(inp_4),
                    .inp_5(inp_5),
                    .inp_6(inp_6),
                    .inp_7(inp_7),
                    .inp_sel(sel), 
                    .out_0(out_0));
  
  initial begin
    //Initialization
    inp_0=0;
    inp_1=0;
    inp_2=0;
    inp_3=0;
    inp_4=0;
    inp_5=0;
    inp_6=0;
    inp_7=0;
    
    // Initial Delay 
    #10;
    
    // Randomized the inputs
    inp_0=$random;
    inp_1=$random;
    inp_2=$random;
    inp_3=$random;
    inp_4=$random;
    inp_5=$random;
    inp_6=$random;
    inp_7=$random;
    
    // Monitor the inputs and outputs of the mux
    $monitor("[%0t] : inp_0='b%b inp_1='b%b inp_2='b%b inp_3='b%b inp_4='b%b inp_5='b%b inp_6='b%b inp_7='b%b sel='b%b out_0='b%b",$time,inp_0,inp_1,inp_2,inp_3,inp_4,inp_5,inp_6,inp_7,sel,out_0);
    
    // Test Pattern for select line
    for(integer i=0;i<8;i=i+1) begin
      sel=i;
      #10;
    end
    
  	$finish;
  end
  
  initial begin
    $dumpvars();
    $dumpfile("wave.vcd");
  end
  
endmodule
