`timescale 1ns/1ps

module two_bit_adder(
  input  [1:0] A,
  input  [1:0] B,
  output [2:0] SUM   // 2-bit + 2-bit = 3 bits
);
  assign SUM = A + B;
endmodule