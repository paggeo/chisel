module Adder(
  input        clock,
  input        reset,
  input  [2:0] io_A,
  input  [2:0] io_B,
  output [2:0] io_C
);
  assign io_C = io_A + io_B; // @[Adder.scala 10:16]
endmodule
