`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2020 15:17:13
// Design Name: 
// Module Name: vending_machine_tb
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


module vending_machine_tb();

wire nw_pa;
reg [1 : 0] coin;
reg clk, rst;

vending_machine v_m(.nw_pa(nw_pa), .clk(clk), .coin(coin), .rst(rst));

initial clk = 1'b1;
always #1000 clk = ~clk;


initial begin
    rst = 1;

    #5000;

    rst = 0;
    coin = 2'b01;

    #5000;

    coin = 2'b10;
end


endmodule
