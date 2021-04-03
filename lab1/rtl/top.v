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
localparam LEFT_BUT = 0;
localparam RIGHT_BUT = 1;


reg [6:0] hex_extra;
//===============
//to segments
DC_DEC s_segm(
      .x_bus(SW[4:0]),
      .HEX0(hex_extra),
      .DP0(DP)
);
//==================


// ==========================
//btn_press_flag
reg [2:0] btn_delay;
wire      btn_press_R;
assign btn_press_R = !btn_delay[2] & btn_delay[1] & btn_delay[0];
always @(posedge clk) begin
    if(!reset) begin
        btn_delay <= 'b0;
    end else begin
       btn_delay <= {btn_delay[1:0], BTN[RIGHT_BUT]};
    end
end 
//===============================

//============================
//cycling shift registr
reg [7:0] an_shift;
always @(posedge clk) begin
    if(!reset)
       an_shift = 'b1111_1110;
    else begin
       an_shift = {an_shift[6:0], an_shift[7]};
     end
end 
//============================

assign AN = an_shift;

//=======================
//shift hex left
integer it;
reg [6:0] all_hexs [7:0];
//reg [6:0] a0, a1, a2, a3, a4;
always @(posedge clk) begin 
  if(!reset) begin
      for(it = 0; it < 8; it = it + 1) 
        all_hexs[it] <= 'b1111_1111;
  end else if (btn_press_R) begin 
//      all_hexs <= {all_hexs[5:0], HEX};
      all_hexs[0] <= all_hexs[1];
      all_hexs[1] <= all_hexs[2];
      all_hexs[2] <= all_hexs[3];
      all_hexs[3] <= all_hexs[4];
      all_hexs[4] <= hex_extra;
  end
end 
//==============================

//=========================
//multiplec has return necessary hex 
reg [6:0] hex_mult;
always @(an_shift) begin
  case(an_shift)
  
    8'b1111_1110:       hex_mult <= all_hexs[0];
    8'b1111_1101:       hex_mult <= all_hexs[1];
    8'b1111_1011:       hex_mult <= all_hexs[2];
    8'b1111_0111:       hex_mult <= all_hexs[3];
    8'b1110_1111:       hex_mult <= all_hexs[4];
    8'b1101_1111:       hex_mult <= all_hexs[5];
    8'b1011_1111:       hex_mult <= all_hexs[6];
    8'b0111_1111:       hex_mult <= all_hexs[7];
    
    default:            hex_mult <= all_hexs[0];
  endcase
end

assign HEX = hex_mult;    
//=======================


//assign HEX = all_hexs;
//=========================
//shift
// reg[6:0] hex_shift;

// assign HEX = hex_shift;
// assign DP =  'b0;
// assign AN =  'b1111_1110;

// always @(posedge clk) begin
//     if(!reset) begin
//         hex_shift <= 'b1111_1110;
//     end else  begin
//         hex_shift <= {hex_shift[5:0], hex_shift[6]};
//     end
// end 


///=============================
//count of press
//reg [COUNT_WIDTH-1:0] count;
//always @(posedge clk) begin
//    if(!reset) begin
//        count <= 'b0;
//    end else if (btn_press_R) begin
//        count <= count + COUNT_INC;
//    end
//end 
//========================
endmodule