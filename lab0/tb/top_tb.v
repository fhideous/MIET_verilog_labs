`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 01:05:52 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb( );
   reg [15:0]     SW;
   reg [4:0]      BTN;
   
   wire [15:0]      LED;
   wire             CA;
   wire             CB;
   wire             CC;
   wire             CD;
   wire             CE;
   wire             CF;
   wire             CG;
   wire             DP;
   wire [7:0]       AN;

top dut(

    .SW     ( SW ),
    .BTN    ( BTN ),
    
    .LED    ( LED ),
    .CA     ( CA ),
    .CB     ( CB ),
    .CC     ( CC ),
    .CD     ( CD ),
    .CE     ( CE ),
    .CF     ( CF ),
    .CG     ( CG )
);

initial begin 
    SW = 16'h5;
    #100;
    SW = 16'h1111;
    #100;
    SW = 16'h2222;
    #100;
    $stop;    
end

initial begin 
    BTN = 5'h19;
    repeat(10) begin
    #10;
    BTN = BTN + 1'b1;
    end
    #150;
    BTN = 5'h22;
    $stop;    
end
    
endmodule
