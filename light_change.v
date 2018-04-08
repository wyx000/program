`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/28 19:41:56
// Design Name: 
// Module Name: light_change
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


module light_change(
input [6:0] key,
input [2:0]button,
input replay,
output reg [10:0]light
    );
      
    always@(key or button or replay)
     begin
     light={replay,button,key};
     end  
endmodule
