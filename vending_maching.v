`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2020 15:11:15
// Design Name: 
// Module Name: vending_maching
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


module vending_machine(nw_pa,clk,coin,rst);

   output reg nw_pa;
   input [1 : 0] coin;
   input clk, rst;
   reg [1 : 0] state;
   reg [1 : 0] next_state;


   parameter [1 : 0] s0 = 2'b00;
   parameter [1 : 0] s5 = 2'b01;
   parameter [1 : 0] s10 = 2'b10;
   parameter [1 : 0] s15 = 2'b11;


   always @(posedge clk)begin
       if (rst)
       state = s0;
       else
       state = next_state;
       end


   always @(state,coin)begin
       case (state)
       s0:begin
           if (coin==2'b00)
           next_state=s0;
           else if (coin==2'b01)
           next_state=s5;
           else if (coin==2'b10)
           next_state=s10;
           end
        s5:begin
            if (coin==2'b00)
            next_state=s5;
            else if (coin==2'b01)
            next_state=s10;
            else if (coin==2'b10)
            next_state=s15;
            end
       s10:begin
           if (coin==2'b00)
           next_state=s10;
           else if (coin==2'b01)
           next_state=s15;
           else if (coin==2'b10)
           next_state=s15;  
           end
       s15:begin
           next_state=s0;
           end
       default : next_state=s0;
   
    endcase 
     end 


   always @(state)
   begin
       case (state)
       s0 : nw_pa<=1'b0;
       s5 : nw_pa<=1'b0;
       s10: nw_pa<=1'b0;
       s15: nw_pa<=1'b1;
       default: nw_pa<=1'b0;
       endcase 
    end
 
endmodule

