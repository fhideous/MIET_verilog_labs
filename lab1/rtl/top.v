module top
//#(
//    parameter COUNT_INC = 3
// )
(   
   input clk,
   input reset,
   
   input [15:0]     SW,
   input [4:0]      BTN,
   
//   output [15:0]    LED,   
   output [6:0]     HEX,
   output           DP,
   output [7:0]     AN

);

//localparam COUNT_WIDTH = 16;
localparam LEFT_BUT = 3;
localparam RIGHT_BUT = 2;


wire [6:0] hex_extra;
//===============
//to segments
DC_DEC s_segm(
      .x_bus(SW[4:0]),
      .HEX0(hex_extra),
      .DP0(DP)
);
//==================


// ==========================
//btns_press_flags
reg [2:0] btn_delay_R, btn_delay_L;
wire      btn_press_R, btn_press_L;
assign btn_press_R = !btn_delay_R[2] & btn_delay_R[1] & btn_delay_R[0];
assign btn_press_L = !btn_delay_L[2] & btn_delay_L[1] & btn_delay_L[0];
always @(posedge clk) begin
    if(!reset) begin
        btn_delay_R <= 'b0;
        btn_delay_L <= 'b0;
    end else begin
       btn_delay_R <= {btn_delay_R[1:0], BTN[RIGHT_BUT]};
       btn_delay_L <= {btn_delay_L[1:0], BTN[LEFT_BUT]};

    end
end 
//===============================

reg[13:0] switch;
wire    tick_sig;

always @(posedge clk) begin
    if(!reset)
        switch <= 'b0;
     else begin
     
     if (switch == 10000)
        switch <= 'b0;
     else
        switch <= ('b1 + switch);
     end 

end
assign tick_sig = (switch == 9999);
//============================
//cycling shift registr
reg [7:0] an_shift;
always @(posedge clk) begin
    if(!reset)
       an_shift = 'b1111_1110;
    else if (tick_sig)
       an_shift = {an_shift[6:0], an_shift[7]};
end 
//============================

assign AN = an_shift;

//=======================
//shift hexs
integer it;
assign DP =  'b1;
reg [6:0] all_hexs [0:7];
always @(posedge clk) begin 
  if(!reset) begin
      for(it = 0; it < 8; it = it + 1) 
        all_hexs[it] <= 'b111_1111;
  end else if (btn_press_R) begin 
      //all_hexs <= {all_hexs[0:6], HEX};
      all_hexs[7] <= all_hexs[6];
      all_hexs[6] <= all_hexs[5];
      all_hexs[5] <= all_hexs[4];
      all_hexs[4] <= all_hexs[3];
      all_hexs[3] <= all_hexs[2];
      all_hexs[2] <= all_hexs[1];
      all_hexs[1] <= all_hexs[0];
      all_hexs[0] <= hex_extra;
  end else if (btn_press_L) begin
      all_hexs[0] <= all_hexs[1];
      all_hexs[1] <= all_hexs[2];
      all_hexs[2] <= all_hexs[3];
      all_hexs[3] <= all_hexs[4];
      all_hexs[4] <= all_hexs[5];
      all_hexs[5] <= all_hexs[6];
      all_hexs[6] <= all_hexs[7];
      all_hexs[7] <= 'b111_1111;
  end
end 
//==============================

//=========================
//multiplec has return necessary hex 
reg [6:0] hex_mult;
always @(AN) begin
  case(AN)
  
    8'b1111_1110:       hex_mult <= all_hexs[0];
    8'b1111_1101:       hex_mult <= all_hexs[1];
    8'b1111_1011:       hex_mult <= all_hexs[2];
    8'b1111_0111:       hex_mult <= all_hexs[3];
    8'b1110_1111:       hex_mult <= all_hexs[4];
    8'b1101_1111:       hex_mult <= all_hexs[5];
    8'b1011_1111:       hex_mult <= all_hexs[6];
    8'b0111_1111:       hex_mult <= all_hexs[7];
    
    default:            hex_mult <= 7'b111_1111;
  endcase
end

assign HEX = hex_mult;    
//=======================


//assign HEX = all_hexs;
//=========================
//shift
// reg[6:0] hex_shift;

// assign HEX = hex_shift;

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