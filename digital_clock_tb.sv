// Description : Verification of Digital Clock with Alarm
// Date : 04/04/2026
// Owner : Soham Sen

// Test Bench 
module digital_clock_tb;
  
  // Test signals
  reg clk,rstn;
  reg [1:0] mode;
  reg [4:0] hour_i;
  reg [5:0] min_i;
  reg stop_alarm;
  wire alarm_sound;
  wire [4:0] hour_o;
  wire [5:0] min_o;
  wire [5:0] sec_o;
  
  // DUT Initialization
  digital_clock clock(.clk_inp(clk),
                      .rstn_inp(rstn),
                      .mode_inp(mode),
                      .hour_inp(hour_i),
                      .min_inp(min_i),
                      .stop_alarm_inp(stop_alarm),
                      .alarm_sound_out(alarm_sound),
                      .hour_out(hour_o),
                      .min_out(min_o),
                      .sec_out(sec_o));
  
  // Clock Generation
  always #1 clk=~clk;
  
  initial begin
    // Initialization
	  clk=1;
    rstn=0;
    mode=0;
    hour_i=0;
    min_i=0;
    stop_alarm=0;
    #10;
    // Reset Deasserted
    rstn=1;
    #1000;
    // Set TIME
    mode=2'b01;
    hour_i=0;
    min_i=40;
    #100;
    // Set ALARM
    mode=2'b10;
    hour_i=1;
    min_i=20;
    #9000;
    $finish;
  end
  
  // Test Signal Monitoring 
  initial begin
    $monitor("Time:%0tns hour=%d min=%0d sec=%d alarm_sound=%0d stop_alarm=%0d hour_alarm=%d min_alarm=%d",$time,hour_o,min_o,sec_o,alarm_sound,stop_alarm,hour_i,min_i);
  end
  
  // Dump in waves
  initial begin
    $dumpvars();
    $dumpfile("digital_clock_tb.vcd");
  end
  
endmodule
