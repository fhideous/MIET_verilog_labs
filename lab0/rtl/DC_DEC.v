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
    input   x0,
    input   x1,
    input   x2,
    input   x3,
    output  [7:0] HEX0
    );

wire[3:0] x_bus;
reg [7:0] dc_dec_out;

assign x_bus = {x3, x2, x1, x0};

always @(x_bus) begin
  case(x_bus)
    4'b0000:    dc_dec_out <= 8'b1100_0000;
    4'b0001:    dc_dec_out <= 8'b1111_1001;
    4'b0010:    dc_dec_out <= 8'b1010_0100;
    4'b0011:    dc_dec_out <= 8'b1011_0000;
    4'b0100:    dc_dec_out <= 8'b1001_1001;
    4'b0101:    dc_dec_out <= 8'b1001_0010;
    4'b0110:    dc_dec_out <= 8'b1000_0010;
    4'b0111:    dc_dec_out <= 8'b1111_1000;
    4'b1000:    dc_dec_out <= 8'b1000_0000;
    4'b1001:    dc_dec_out <= 8'b1001_0000;
    4'b1010:    dc_dec_out <= 8'b1000_1000;
    4'b1011:    dc_dec_out <= 8'b1000_0011;
    4'b1100:    dc_dec_out <= 8'b1111_0000;
    4'b1101:    dc_dec_out <= 8'b1010_0001;
    4'b1110:    dc_dec_out <= 8'b1011_0000;
    4'b1111:    dc_dec_out <= 8'b1011_1000;
    default:    dc_dec_out <= 8'b1111_1111;
  endcase
end

assign  HEX0 = dc_dec_out;  
   

endmodule   
