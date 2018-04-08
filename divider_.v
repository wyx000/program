`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Design Name: 
// Module Name: divider
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


module divider(
input I_CLK,
input [31:0]N,
output reg O_CLK
    );
    reg [31:0]c=0;
        always @ (posedge I_CLK)
          begin
            if (c == N)
            begin
              c =0;
              O_CLK=~O_CLK;
            end
            else
              c = c + 1;
            end
endmodule
