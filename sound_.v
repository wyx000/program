`timescale 1ns / 1ps

  module sound( sys_CLK ,button,replay,key,high,low,audio,light);
  input     sys_CLK;
   input  [2:0]  button;
   input replay;
   input  [6:0]key;
   input high,low;
  output    audio;
  output [10:0]light;
  
  //wire [10:0]light;
 //reg  [23:0] counter4Hz,counter6MHz;
 reg  [13:0]  count,origin;
reg audiof;
wire clk_6MHz;
wire clk_4Hz;
 reg  [6:0]  j;
 reg  [7:0]  len=0;
 reg [50:0]track[6:0];
reg [4:0]track_c;

 assign audio=(button||key)?audiof:1'b1;  //控制开关 
 
light_change l1(key,button,replay,light);

 divider d6MHz(sys_CLK,8,clk_6MHz);//6MHz分频
  divider d4Hz(sys_CLK,12500000,clk_4Hz);//4Hz分频

//count_audio c1(clk_6MHz,origin,audiof);
  always @(posedge clk_6MHz)
begin
    if((count==16383)&&origin)    
    begin
        count=origin;
         audiof=~audiof;
     end
    else
        count=count+1;
  end
 
 //play_part p1(clk_4Hz,key,button,replay, high,low, audiof);
 always @(posedge clk_4Hz)       
 begin
     case(j)
     'd1:origin='d4916;  //low
   'd2:origin='d6168;
    'd3:origin='d7281;
   'd4:origin='d7791;
   'd5:origin='d8730;
    'd6:origin='d9565;
    'd7:origin='d10310;
    'd8:origin='d010647;  //middle
   'd9:origin='d011272;
   'd10:origin='d011831;
     'd11:origin='d012087;
    'd12:origin='d012556;
   'd13:origin='d012974;
     'd14:origin='d013346;
   'd15:origin='d13516;  //high
    'd16:origin='d13829;
     'd17:origin='d14108;
    'd18:origin='d11535;
    'd19:origin='d14470;
     'd20:origin='d14678;
   'd21:origin='d14864;
    default:origin='d0;
    endcase             
 end

 always @(posedge clk_4Hz)  //乐谱
 begin   
 if(button==3'b001)
 begin
    if(len>28)
        len=0;
     else
        len=len+1;
    case(len)
     0:j=10;
     1:j=9;
     2:j=8;
     3:j=9;
     4:j=10;
     5:j=10;
      6:j=10;
     7:j=0;
      8:j=9;
      9:j=9;
     10:j=9;
     11:j=10;
     12:j=12;
     13:j=12;
     14:j=0;
     15:j=10;
     16:j=9;
     17:j=8;
     18:j=9;
     19:j=10;
     20:j=10;
     21:j=10;
     22:j=8;
     23:j=0;
     24:j=9;
     25:j=9;
     26:j=10; 
     27:j=9;
     28:j=8;
     29:j=0;   
     default;    
endcase               
 end
 else if(button==3'b010)
 begin
    if(len>62)
         len=0;
     else
         len=len+1;
     case(len)
      0:j=3;
      1:j=3;
      2:j=3;
      3:j=3;
      4:j=5;
      5:j=5;
      6:j=5;
      7:j=6;
      8:j=8;
      9:j=8;
      10:j=8;
      11:j=6;
      12:j=6;
      13:j=6;
      14:j=6;
      15:j=12;
      16:j=12;
      17:j=12;
      18:j=15;
      19:j=15;
      20:j=15;
      21:j=15;
      22:j=15;
      23:j=9;
      24:j=9;
      25:j=9;
      26:j=9;
      27:j=9;
      28:j=9;
      29:j=9;
      30:j=9;
      31:j=9;
      32:j=9;
      33:j=9;
      34:j=10;
      35:j=7;
      36:j=7;
      37:j=6;
      38:j=6;
      39:j=5;
      40:j=5;
      41:j=5;
      42:j=6;
      43:j=8;
      44:j=8;
      45:j=9;
      46:j=9;
      47:j=3;
      48:j=3;
      49:j=8;
      50:j=8;
      51:j=8;
      52:j=5;
      53:j=5;
      54:j=8;
      55:j=5;
      56:j=5;
      57:j=5;
      58:j=5;
      59:j=5;
      60:j=5;
      61:j=5;
      62:j=5;
      63:j=5;
       default;
 endcase    
  end
  
  else if(button==3'b100)
  begin
   if(len>99)
          len=0;
      else
          len=len+1;
      case(len)
       0:j=8;
       1:j=8;
       2:j=8;
       3:j=7;
       4:j=7;
       5:j=7;
       6:j=7;
       7:j=5;
       8:j=5;
       9:j=3;
       10:j=3;
       11:j=3;
       12:j=3;
       13:j=3;
       14:j=3;
       15:j=7;
       16:j=7;
       17:j=7;
       18:j=7;
       19:j=6;
       20:j=6;
       21:j=6;
       22:j=6;
       23:j=8;
       24:j=8;
       25:j=8;
       26:j=7;
       27:j=7;
       28:j=8;
       29:j=8;
       30:j=7;
       31:j=7;
       32:j=9;
       33:j=9;
       34:j=10;
       35:j=10;
       36:j=10;
       37:j=10;
       38:j=10;
       39:j=10;
       40:j=10;
       41:j=10;
       42:j=10;
       43:j=10;
       44:j=0;
       45:j=6;
       46:j=8;
       47:j=6;
       48:j=8;
       49:j=8;
       50:j=8;
       51:j=8;
       52:j=8;
       53:j=10;
       54:j=9;
       55:j=9;
       56:j=9;
       57:j=9;
       58:j=0;
       59:j=5;
       60:j=7;
       61:j=5;
       62:j=7;
       63:j=7;
       64:j=7;
       65:j=7;
       66:j=9;
       67:j=9;
       68:j=8;
       69:j=8;
       70:j=8;
       71:j=8;
       72:j=8;
       73:j=8;
        74:j=0;
       75:j=10;
       76:j=10;
       77:j=9;
       78:j=8;
       79:j=8;
       80:j=8;
       81:j=8;
       82:j=9;
       83:j=9;
       84:j=8;
       85:j=8;
       86:j=8;
       87:j=6;
       88:j=6;
       89:j=5;
       90:j=5;
       91:j=5;
       92:j=5;
       93:j=5;
       94:j=8;
       95:j=7;
       96:j=6;
       97:j=5;
       98:j=5;
       99:j=5;
       100:j=5; 
        default;  
  endcase 
  end  
  else if(replay==1'b1)
    begin
     if(len>50)
            len=0;
        else
            len=len+1;  
            j=track[len];
            end
 else 
 begin
 if(key=='b0000001)
 begin;
        if(high)
        j=15;
        else if(low)
        j=1;
        else
        j=8;
       end
 else if(key=='b0000010)
        begin;
        if(high)
        j=16;
        else if(low)
        j=2;
        else
        j=9;
       end
                
                else if(key=='b0000100)
                 begin;
                       if(high)
                       j=17;
                       else if(low)
                       j=3;
                       else
                       j=10;
                      end
                        
                        else if(key=='b0001000)
                         begin;
                               if(high)
                               j=18;
                               else if(low)
                               j=4;
                               else
                               j=11;
                              end
                                
    else if(key=='b0010000)
                                 begin;
           if(high)
           j=19;
           else if(low)
           j=5;
           else
           j=12;
          end
                                        
else if(key=='b0100000)
  begin;
        if(high)
        j=20;
        else if(low)
        j=6;
        else
        j=13;
       end
 else if(key=='b1000000)
  begin;
        if(high)
        j=21;
        else if(low)
        j=7;
        else
        j=14;
       end                                                                     
else
j=0;
if(track_c>50)
track_c=0;
else if(track_c==0||(track[track_c-1]!=j))
begin
track[track_c]=j;
track_c=track_c+1;
end
else
track_c=track_c;
end
end

endmodule