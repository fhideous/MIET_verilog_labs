module top
#(
    parameter COUNT_INC = 3
)
(
    
   input clk,
   input reset, 
   
   
   input [15:0]     SW,
   input [4:0]      BTN,
   
   output [15:0]    LED,   
   output [6:0]     HEX,
   output           DP,
   output [7:0]     AN

);

localparam COUNT_WIDTH = 16;
//localparam COUNT_INC   = 3;

reg [COUNT_WIDTH-1:0] count;
reg [COUNT_WIDTH-1:0] countl;

assign LED = count;

reg [2:0] btn_delay;
/*
*   ?????? ??????, ???????? ???????? ?? ?????????? ?????????? ?????? clk
*/
wire      btn_press;
 
assign btn_press = !btn_delay[2] & btn_delay[1] & btn_delay[0];

always @(posedge clk) begin
    if(!reset) begin
        btn_delay <= 'b0;
    end else begin
    /*
    * ???????????? ??????:  54 = 55+56(?? ?????)
    */
       btn_delay <= {btn_delay[1:0],BTN[0]};
//        btn_delay[2:1] <= {btn_delay[1:0],BTN[0]};
//        btn_delay <= BTN[0];
        
    end
end 

always @(posedge clk) begin
/*
*   ???? ??????????? ??????, ?????? ? ??????
*/
    if(!reset) begin
        count <= 'b0;
    end else if (btn_press) begin
        count <= count + COUNT_INC;
    end
end 

//=========================

reg[6:0] hex_shift;

assign HEX = hex_shift;
assign DP =  'b0;
assign AN =  'b1111_1110;

always @(posedge clk) begin
    if(!reset) begin
        hex_shift <= 'b1111_1110;
    end else  begin
        hex_shift <= {hex_shift[5:0], hex_shift[6]};
    end
end 


endmodule