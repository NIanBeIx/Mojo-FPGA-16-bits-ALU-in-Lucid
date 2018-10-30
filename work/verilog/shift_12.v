/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shift_12 (
    input [1:0] alufn10,
    input [15:0] a,
    input [3:0] b,
    output reg [15:0] out
  );
  
  
  
  wire [16-1:0] M_shl_x;
  reg [4-1:0] M_shl_b;
  reg [16-1:0] M_shl_a;
  muxleft_15 shl (
    .b(M_shl_b),
    .a(M_shl_a),
    .x(M_shl_x)
  );
  
  wire [16-1:0] M_shr_x;
  reg [4-1:0] M_shr_b;
  reg [16-1:0] M_shr_a;
  muxright_16 shr (
    .b(M_shr_b),
    .a(M_shr_a),
    .x(M_shr_x)
  );
  
  wire [16-1:0] M_sra_x;
  reg [4-1:0] M_sra_b;
  reg [16-1:0] M_sra_a;
  muxrightsign_17 sra (
    .b(M_sra_b),
    .a(M_sra_a),
    .x(M_sra_x)
  );
  
  always @* begin
    M_shl_a = a;
    M_shl_b = b;
    M_shr_a = a;
    M_shr_b = b;
    M_sra_a = a;
    M_sra_b = b;
    
    case (alufn10)
      2'h0: begin
        out = M_shl_x;
      end
      2'h1: begin
        out = M_shr_x;
      end
      2'h3: begin
        out = M_sra_x;
      end
      default: begin
        out = 16'hffff;
      end
    endcase
  end
endmodule