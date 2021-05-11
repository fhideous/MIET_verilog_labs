`timescale 1ns / 1ps

module top_tb( );
   //inputs
   reg            clk;
   reg            reset;
   reg [15:0]     SW;
   reg [4:0]      BTN;
   
   //outputs
   wire [6:0]     HEX;
   wire           DP;
   wire [7:0]     AN;
   
   localparam CLK_SEMIPERIOD = 5;
   localparam LEFT_BUT = 2;
    localparam RIGHT_BUT = 3;
    
top DUT
(
    .clk     ( clk ),
    .reset   ( reset ),
    .SW      ( SW ),
    .BTN     ( BTN ),
    
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
/*
initial begin
    reset = 'b0;
    #500;
    reset = 'b1;
end 

initial begin
    #1000
    SW = 'b0000_0000_0000_0010;
    BTN = 4'b0;
    #300
    BTN[LEFT_BUT] = 'b0;  
    #100
    BTN[LEFT_BUT] = 'b1;
    #100
    BTN[LEFT_BUT] = 'b0;
    SW = 'b0000_0000_0000_1000;
    BTN[LEFT_BUT]= 'b0;  
        #100

    BTN[LEFT_BUT] = 'b1;
        #100

    BTN[LEFT_BUT]= 'b0;

    SW = 'b0000_0000_0000_1101;
    BTN = 'b0;  
        #100

    BTN[LEFT_BUT]= 'b1;
        #100

    BTN[LEFT_BUT] = 'b0;
     
end
*/
endmodule