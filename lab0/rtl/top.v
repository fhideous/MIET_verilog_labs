module top(
   input [15:0]     SW,
   
   output           CA,
   output           CB,
   output           CC,
   output           CD,
   output           CE,   
   output           CF,
   output           CG,
   output           DP,
   
   output [7:0]     AN

);

wire [7:0] HEX;

assign AN = 'b0000_0000;

wire [3:0] f;
assign f   = (~SW[0] & SW[1] & SW[2] & (~SW[3]));

wire      [3:0]dc1_out;
DC1 dc1(
    .x0(SW[0]),
    .x1(SW[1]),
    .x2(SW[2]),
    .x3(SW[3]),
    .what(dc1_out)
);

wire      [3:0]dc2_out;
DC2 dc2(
    .x(SW[7:4]),
    .what(dc2_out)
);

reg[3:0] x_bus;

always @(SW) begin
  case(SW[9:8])
  2'b00     : x_bus = dc1_out;
  2'b01     : x_bus = dc2_out;
  2'b10     : x_bus = f;
  2'b11     : x_bus = SW[3:0];
endcase
end

DC_DEC s_segm(
    .x0(x_bus[0]),
    .x1(x_bus[1]),
    .x2(x_bus[2]),
    .x3(x_bus[3]),
    .HEX0(HEX)
);

assign           CA = HEX[0];
assign           CB = HEX[1];
assign           CC = HEX[2];
assign           CD = HEX[3];
assign           CE = HEX[4];  
assign           CF = HEX[5];
assign           CG = HEX[6];
assign           DP = HEX[7];

endmodule