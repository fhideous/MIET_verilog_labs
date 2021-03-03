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

wire f;
assign f   = (~SW[0] & SW[1] & SW[2] & (~SW[3]));

wire      dc1_out;
DC1 dc1(
    .x0(SW[0]),
    .x1(SW[1]),
    .x2(SW[2]),
    .x3(SW[3]),
    .what(dc1_out)
);

wire      dc2_out;
DC2 dc2(
    .x0(SW[4]),
    .x1(SW[5]),
    .x2(SW[6]),
    .x3(SW[7]),
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
    .HEX0(AN)
);

assign           CA = AN[0];
assign           CB = AN[1];
assign           CC = AN[2];
assign           CD = AN[3];
assign           CE = AN[4];  
assign           CF = AN[5];
assign           CG = AN[6];
assign           DP = AN[7];

endmodule