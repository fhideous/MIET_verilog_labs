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
   reg [15:0]     SW;;
   
   wire             CA;
   wire             CB;
   wire             CC;
   wire             CD;
   wire             CE;
   wire             CF;
   wire             CG;
   wire             DP;
   wire [7:0]       AN;
   wire [7:0]       HEX;
   
top dut(

    .SW     ( SW ),


    .CA     ( CA ),
    .CB     ( CB ),
    .CC     ( CC ),
    .CD     ( CD ),
    .CE     ( CE ),
    .CF     ( CF ),
    .CG     ( CG ),
    .DP     ( DP )
);

initial begin 
  SW = 16'd0;
  #10;
  repeat(1024)
  begin 
    #10;
    SW = SW + 16'd1;
  end
end

//initial begin 
//  SW[4] = 1'd0;
//  SW[5] = 1'd0;
//  SW[6] = 1'd0;
//  SW[7] = 1'd0;
  
//  #10;
//  repeat(32)
//  begin 
//    #10;
//    SW[4] = SW[4] + 1'd1;
//    #20;
//    SW[5] = SW[5] + 1'd1;
//    #30;
//    SW[6] = SW[6] + 1'd1;
//    #40;
//    SW[7] = SW[7] + 1'd1;
//     #10;
//    SW[4] = SW[4] - 1'd1;
//    #20;
//    SW[5] = SW[5] - 1'd1;
//    #30;
//    SW[6] = SW[6] - 1'd1;
//    #40;
//    SW[7] = SW[7] - 1'd1;
//  end
//end



//initial begin 
//  SW[8] = 1'd0;
//  SW[9] = 1'd0;
//  #100;
//  SW[8] = SW[8] + 1'd1;
//  #100;
//  SW[9] = SW[9] + 1'd1;
//  #100;
//  SW[8] = SW[8] - 1'd1;
//  #100;
//  SW[9] = SW[9] - 1'd1;
//end

endmodule
