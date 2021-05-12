`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Companres_out: 
// Engineer: 
// 
// Create Date: 02/23/2021 06:38:42 PM
// Design Name: 
// Module Name: DC_DEC
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



module DC_DEC(
    input   [4:0] x_bus,
    output    [6:0] HEX0,
    output        DP0
    );

reg [7:0] dc_dec_out;

always @(x_bus) begin
  case(x_bus)
    //A- E  
    5'b00000:    dc_dec_out <= 8'b1000_1000;
    5'b00001:    dc_dec_out <= 8'b1000_0011;
    5'b00010:    dc_dec_out <= 8'b1100_0110;
    5'b00011:    dc_dec_out <= 8'b1010_0001;
    5'b00100:    dc_dec_out <= 8'b1000_0110;
    //F-J
    5'b00101:    dc_dec_out <= 8'b1000_1110;
    5'b00110:    dc_dec_out <= 8'b1001_0000;
    5'b00111:    dc_dec_out <= 8'b1000_1001;
    5'b01000:    dc_dec_out <= 8'b1100_1111;
    5'b01001:    dc_dec_out <= 8'b1110_0001;
    //K-O
    5'b01010:    dc_dec_out <= 8'b1000_1001;
    5'b01011:    dc_dec_out <= 8'b1100_0111;
    5'b01100:    dc_dec_out <= 8'b1110_1010;
    5'b01101:    dc_dec_out <= 8'b1010_1011;
    5'b01110:    dc_dec_out <= 8'b1100_0000;
    //P-T
    5'b01111:    dc_dec_out <= 8'b1000_1100;
    5'b10000:    dc_dec_out <= 8'b1001_1000;
    5'b10001:    dc_dec_out <= 8'b1010_1111;
    5'b10010:    dc_dec_out <= 8'b1001_0010;
    5'b10011:    dc_dec_out <= 8'b1000_0111;
    //U-Y
    5'b10100:    dc_dec_out <= 8'b1100_0001;
    5'b10101:    dc_dec_out <= 8'b1100_0001;
    5'b10110:    dc_dec_out <= 8'b111_00011;
    5'b10111:    dc_dec_out <= 8'b1101_0101;
    5'b11000:    dc_dec_out <= 8'b1001_0001;
    //Z
    5'b11001:    dc_dec_out <= 8'b1010_0100;

    default:    dc_dec_out <= 8'b1111_1111;
  endcase
end

assign  HEX0 = dc_dec_out[6:0];  
assign  DP0  = dc_dec_out[7];

endmodule   
