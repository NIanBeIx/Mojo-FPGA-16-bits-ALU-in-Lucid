/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_4 (
    input [2:0] alufn20,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] out,
    output reg n,
    output reg z,
    output reg v
  );
  
  
  
  reg [15:0] xb;
  
  reg [15:0] temp;
  
  wire [16-1:0] M_add_sum;
  reg [16-1:0] M_add_a;
  reg [16-1:0] M_add_b;
  reg [1-1:0] M_add_alufn0;
  addition_13 add (
    .a(M_add_a),
    .b(M_add_b),
    .alufn0(M_add_alufn0),
    .sum(M_add_sum)
  );
  
  always @* begin
    M_add_alufn0 = 1'h0;
    M_add_b = 1'h0;
    M_add_a = 1'h0;
    xb = 16'h0000;
    z = 1'h0;
    v = 1'h0;
    v = 1'h0;
    n = 1'h0;
    
    case (alufn20)
      3'h0: begin
        M_add_alufn0 = alufn20[0+0-:1];
        M_add_a = a;
        M_add_b = b;
        temp = M_add_sum;
      end
      3'h1: begin
        xb = b ^ {5'h10{alufn20[0+0-:1]}};
        M_add_alufn0 = alufn20[0+0-:1];
        M_add_a = a;
        M_add_b = xb;
        temp[0+15-:16] = M_add_sum[0+15-:16];
      end
      3'h2: begin
        temp[0+15-:16] = a * b;
      end
      3'h3: begin
        temp[0+15-:16] = a / b;
      end
      3'h7: begin
        temp[0+15-:16] = a - (a / b * b);
      end
      default: begin
        temp = a + b;
      end
    endcase
    n = temp[15+0-:1];
    v = (a[15+0-:1] & b[15+0-:1] & (~temp[15+0-:1])) | ((~a[15+0-:1]) & (~b[15+0-:1]) & temp[15+0-:1]);
    z = (~|temp);
    out[0+15-:16] = temp[0+15-:16];
  end
endmodule
