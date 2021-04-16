`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 06:19:50 AM
// Design Name: 
// Module Name: DC1
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


module DC1(
    input x3,
    input x2,
    input x1,
    input x0,
    output [3:0]what
    );
    
    assign x01 = x0 & ~x1;
    assign x23 = x2 & ~x3;
    assign x12 = x1 & ~x2;
    assign what = x23 + x12 + x01;   
        
endmodule
