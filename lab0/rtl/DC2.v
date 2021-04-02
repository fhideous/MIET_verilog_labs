`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 06:35:30 AM
// Design Name: 
// Module Name: DC2
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


module DC2(
    input [3:0] x,
    output [3:0]what
    );
     
    assign what = x << 1;
//    assign what = 4'd2 * (x[0] + 4'd2 * x[1] + 4'd4 * x[2] + 4'd8 * x[3]);
    
endmodule
