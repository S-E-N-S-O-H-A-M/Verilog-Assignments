// Description : Digital Clock with Alarm Design
// Date : 04/04/2026
// Owner : Soham Sen

// Digital Clock
module digital_clock(input wire clk_inp,
                     input wire rstn_inp,
                     input wire [1:0] mode_inp, //2'b01 - SET TIME , 2'b10 - SET ALARM
                     input wire [4:0] hour_inp,
                     input wire [5:0] min_inp,
                     input wire stop_alarm_inp,
                     output reg alarm_sound_out,
                     output wire [4:0] hour_out,
                     output wire[5:0] min_out,
                     output wire [5:0] sec_out);
  
  
  // LOCAL SIGNALS
  reg [4:0] hour_counter,hour_alarm;
  reg [5:0] min_counter,min_alarm;
  reg [5:0] sec_counter,sec_alarm;
  reg [1:0] mode;
  
  always_ff@(posedge clk_inp) 
    begin
      // CLOCK START
      if(!rstn_inp) begin
        hour_counter<=0;
        min_counter<=0;
        sec_counter<=0;
        mode<=0;
        hour_alarm<=0;
        min_alarm<=0;
        sec_alarm<=0;
        alarm_sound_out<=0;
      end
      else begin
        if(sec_counter==59) begin
           sec_counter<=0;
          if(min_counter==59) begin
            min_counter<=0;
            if(hour_counter==23) begin
              hour_counter<=0;
            end
            else begin
              hour_counter<=hour_counter+1;
            end
          end
          else begin
          	min_counter<=min_counter+1;  
          end
        end
        else begin
        	sec_counter<=sec_counter+1;
        end
      end
      if(mode_inp==2'b01) begin // SET TIME
        hour_counter<=hour_inp;
        min_counter<=min_inp;
        mode<=mode_inp;
      end
      else if(mode_inp==2'b10) begin // SET ALARM
        hour_alarm<=hour_inp;
        min_alarm<=min_inp;
        mode<=mode_inp;
        if((hour_counter==hour_alarm) && (min_counter==min_alarm)) begin
          if(!stop_alarm_inp) begin
          	alarm_sound_out<=1;
          end
          else begin
            alarm_sound_out<=0;
          end
        end
        else begin
          alarm_sound_out<=0;
        end
      end
  	end
  
  assign hour_out=hour_counter;
  assign min_out=min_counter;
  assign sec_out=sec_counter;
  
endmodule
