/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module tester16_5 (
    input clk,
    input rst,
    input pause,
    input restarttest,
    output reg [15:0] out
  );
  
  
  
  localparam CLKSPEED = 5'h1a;
  
  reg [25:0] M_counter_d, M_counter_q = 1'h0;
  
  wire [16-1:0] M_alu16_out;
  wire [1-1:0] M_alu16_overflow;
  reg [16-1:0] M_alu16_a;
  reg [16-1:0] M_alu16_b;
  reg [6-1:0] M_alu16_alufn;
  alu_3 alu16 (
    .a(M_alu16_a),
    .b(M_alu16_b),
    .alufn(M_alu16_alufn),
    .out(M_alu16_out),
    .overflow(M_alu16_overflow)
  );
  
  localparam START_state = 5'd0;
  localparam ADD_state = 5'd1;
  localparam ADD_OVR_state = 5'd2;
  localparam SUB_state = 5'd3;
  localparam SUB_OVR_state = 5'd4;
  localparam AND_state = 5'd5;
  localparam NAND_state = 5'd6;
  localparam OR_state = 5'd7;
  localparam NOR_state = 5'd8;
  localparam XOR_state = 5'd9;
  localparam XNOR_state = 5'd10;
  localparam A_state = 5'd11;
  localparam SHL_state = 5'd12;
  localparam SHR_state = 5'd13;
  localparam SRA_state = 5'd14;
  localparam CMPEQ_state = 5'd15;
  localparam CMPLT_state = 5'd16;
  localparam CMPLE_state = 5'd17;
  localparam MULTIPLY_state = 5'd18;
  localparam MOD_state = 5'd19;
  localparam END_state = 5'd20;
  
  reg [4:0] M_state_d, M_state_q = START_state;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    M_counter_d = M_counter_q + 1'h1;
    
    case (M_state_q)
      START_state: begin
        M_alu16_alufn = 1'h0;
        out = 16'h0000;
        M_alu16_a = 1'h0;
        M_alu16_b = 1'h0;
        if (restarttest == 1'h1) begin
          M_state_d = ADD_state;
        end
      end
      ADD_state: begin
        M_alu16_alufn = 6'h00;
        M_alu16_a = 16'h7fff;
        M_alu16_b = 16'h0001;
        if (M_alu16_out == 16'h8000) begin
          out = 16'h0111;
        end else begin
          out = 16'h0100;
        end
        if (pause == 1'h0) begin
          M_state_d = ADD_OVR_state;
        end
      end
      ADD_OVR_state: begin
        M_alu16_alufn = 6'h00;
        M_alu16_a = 16'h8000;
        M_alu16_b = 16'hc000;
        if (M_alu16_out == 16'h4000) begin
          out = 16'h0211;
        end else begin
          out = 16'h0200;
        end
        if (pause == 1'h0) begin
          M_state_d = SUB_state;
        end
      end
      SUB_state: begin
        M_alu16_alufn = 6'h01;
        M_alu16_a = 16'h8000;
        M_alu16_b = 16'h7fff;
        if (M_alu16_out == 16'h0001) begin
          out = 16'h0311;
        end else begin
          out = 16'h0300;
        end
        if (pause == 1'h0) begin
          M_state_d = SUB_OVR_state;
        end
      end
      SUB_OVR_state: begin
        M_alu16_alufn = 1'h1;
        M_alu16_a = 16'hbfff;
        M_alu16_b = 16'h4000;
        if (M_alu16_out == 16'h7fff) begin
          out = 16'h0411;
        end else begin
          out = 16'h0400;
        end
        if (pause == 1'h0) begin
          M_state_d = AND_state;
        end
      end
      AND_state: begin
        M_alu16_alufn = 6'h18;
        M_alu16_a = 16'h0001;
        M_alu16_b = 16'h0003;
        if (M_alu16_out == 16'h0001) begin
          out = 16'h0511;
        end else begin
          out = 16'h0500;
        end
        if (pause == 1'h0) begin
          M_state_d = NAND_state;
        end
      end
      NAND_state: begin
        M_alu16_alufn = 6'h17;
        M_alu16_a = 16'h0003;
        M_alu16_b = 16'h0005;
        if (M_alu16_out == 16'hfffe) begin
          out = 16'h0611;
        end else begin
          out = 16'h0600;
        end
        if (pause == 1'h0) begin
          M_state_d = OR_state;
        end
      end
      OR_state: begin
        M_alu16_alufn = 6'h1e;
        M_alu16_a = 16'h000a;
        M_alu16_b = 16'h000f;
        if (M_alu16_out == 16'h000e) begin
          out = 16'h0711;
        end else begin
          out = 16'h0700;
        end
        if (pause == 1'h0) begin
          M_state_d = NOR_state;
        end
      end
      NOR_state: begin
        M_alu16_alufn = 6'h11;
        M_alu16_a = 16'h0003;
        M_alu16_b = 16'h0005;
        if (M_alu16_out == 16'hfff8) begin
          out = 16'h0811;
        end else begin
          out = 16'h0800;
        end
        if (pause == 1'h0) begin
          M_state_d = XOR_state;
        end
      end
      XOR_state: begin
        M_alu16_alufn = 6'h16;
        M_alu16_a = 16'h000a;
        M_alu16_b = 16'h000c;
        if (M_alu16_out == 16'h0006) begin
          out = 16'h0911;
        end else begin
          out = 16'h0900;
        end
        if (pause == 1'h0) begin
          M_state_d = XNOR_state;
        end
      end
      XNOR_state: begin
        M_alu16_alufn = 6'h19;
        M_alu16_a = 16'h000a;
        M_alu16_b = 16'h000c;
        if (M_alu16_out == 16'hfff9) begin
          out = 16'h1011;
        end else begin
          out = 16'h1000;
        end
        if (pause == 1'h0) begin
          M_state_d = A_state;
        end
      end
      A_state: begin
        M_alu16_alufn = 6'h1a;
        M_alu16_a = 16'h000a;
        M_alu16_b = 16'h000c;
        if (M_alu16_out == 16'h000a) begin
          out = 16'h1111;
        end else begin
          out = 16'h1100;
        end
        if (pause == 1'h0) begin
          M_state_d = CMPEQ_state;
        end
      end
      CMPEQ_state: begin
        M_alu16_alufn = 6'h33;
        M_alu16_a = 16'ha003;
        M_alu16_b = 16'ha000;
        if (M_alu16_out == 1'h0) begin
          out = 16'h1211;
        end else begin
          out = 16'h1200;
        end
        if (pause == 1'h0) begin
          M_state_d = CMPLT_state;
        end
      end
      CMPLT_state: begin
        M_alu16_alufn = 6'h35;
        M_alu16_a = 16'h000a;
        M_alu16_b = 16'h000a;
        if (M_alu16_out == 1'h0) begin
          out = 16'h1311;
        end else begin
          out = 16'h1300;
        end
        if (pause == 1'h0) begin
          M_state_d = CMPLE_state;
        end
      end
      CMPLE_state: begin
        M_alu16_alufn = 6'h37;
        M_alu16_a = 16'h4001;
        M_alu16_b = 16'h2038;
        if (M_alu16_out == 1'h1) begin
          out = 16'h1411;
        end else begin
          out = 16'h1400;
        end
        if (pause == 1'h0) begin
          M_state_d = SHL_state;
        end
      end
      SHL_state: begin
        M_alu16_alufn = 6'h20;
        M_alu16_a = 16'h2000;
        M_alu16_b = 16'h0001;
        if (M_alu16_out == 16'h4001) begin
          out = 16'h1511;
        end else begin
          out = 16'h1500;
        end
        if (pause == 1'h0) begin
          M_state_d = SHR_state;
        end
      end
      SHR_state: begin
        M_alu16_alufn = 6'h21;
        M_alu16_a = 16'h0050;
        M_alu16_b = 16'h0003;
        if (M_alu16_out == 16'h000a) begin
          out = 16'h1611;
        end else begin
          out = 16'h1600;
        end
        if (pause == 1'h0) begin
          M_state_d = SRA_state;
        end
      end
      SRA_state: begin
        M_alu16_alufn = 6'h23;
        M_alu16_a = 16'h8008;
        M_alu16_b = 16'h0003;
        if (M_alu16_out == 16'hf001) begin
          out = 16'h1711;
        end else begin
          out = 16'h1700;
        end
        if (pause == 1'h0) begin
          M_state_d = MULTIPLY_state;
        end
      end
      MULTIPLY_state: begin
        M_alu16_alufn = 6'h02;
        M_alu16_a = 16'h0002;
        M_alu16_b = 16'h0002;
        if (M_alu16_out == 16'h0004) begin
          out = 16'h1811;
        end else begin
          out = 16'h1800;
        end
        if (pause == 1'h0) begin
          M_state_d = MOD_state;
        end
      end
      MOD_state: begin
        M_alu16_alufn = 6'h07;
        M_alu16_a = 16'h0004;
        M_alu16_b = 16'h0002;
        if (M_alu16_out == 16'h0000) begin
          out = 16'h1911;
        end else begin
          out = 16'h1900;
        end
        if (pause == 1'h0) begin
          M_state_d = END_state;
        end
      end
      END_state: begin
        out = 16'h9999;
        M_alu16_a = 1'h0;
        M_alu16_b = 1'h0;
        M_alu16_alufn = 1'h0;
        if (restarttest == 1'h1) begin
          M_state_d = ADD_state;
        end
      end
      default: begin
        M_state_d = START_state;
        out = 16'h0000;
        M_alu16_a = 1'h0;
        M_alu16_b = 1'h0;
        M_alu16_alufn = 1'h0;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
  
  always @(posedge M_counter_q[25+0-:1]) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
