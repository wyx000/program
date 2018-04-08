`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/28 11:28:38
// Design Name: 
// Module Name: sound_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sound_tb();
 reg   sys_CLK;
  reg  [2:0]  button;
  reg replay;
  reg  [6:0]key;
 reg high,low;
 wire    audio;
 wire [10:0]light;
 
 sound s1_uut(
sys_CLK,
button,
 replay,
key,
 high,
 low,
audio,
light,
 );
 
 initial
 begin
 sys_CLK=0;
 button=3'b100;
 #500
 button=3'b010;
 #500
  button=3'b001;
 #500
   button=3'b000;
 end
 
 initial
  begin
  #1500
  key=7'b0000001;
  #20
  key=7'b0000010;
  #60
  key=7'b0000100;
 end
 
 initial 
 begin
 #1600
 high=0;
 #10
 high=1;
 #20 high=0;
 low=1;
 #10
 low=0;
 end

 
 always#10 sys_CLK=~sys_CLK;
endmodule
