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
   
   reg            clk;
   reg            reset;
   
   reg [15:0]     SW;
   reg [4:0]      BTN;
   
   wire [6:0]     HEX;
   wire           DP;
//   wire [15:0]    LED;
   wire [7:0]     AN;
   
   localparam CLK_SEMIPERIOD = 5;
   
top
//#(
//    .COUNT_INC( 2 )
//)
DUT
(
    .clk     ( clk ),
    .reset   ( reset ),
    
    .SW      ( SW ),
    .BTN     ( BTN ),
    
//    .LED     ( LED ),
    .HEX     ( HEX ),
    .DP      ( DP ),
    .AN      ( AN )

);

initial begin 
    clk = 'b0;
    forever begin 
        #CLK_SEMIPERIOD clk = ~clk;
    end 
end

initial begin
    reset = 'b0;
    #500;
    reset = 'b1;
end 

initial begin
    SW = 'b0000_0000_0000_0010;
    BTN = 'b0;  
    #1000
    BTN[0] = 'b1;
    #2000;
    BTN[0] = 'b0;
    
    SW = 'b0000_0000_0000_1000;
    BTN = 'b0;  
    #1000;
    BTN[0] = 'b1;
    #2000;
    BTN[0] = 'b0;

    SW = 'b0000_0000_0000_1101;
    BTN = 'b0;  
    #1000;
    BTN[0] = 'b1;
    #2000;
    BTN[0] = 'b0;
     
end

        

endmodule
