module Adder(
  input  [7:0] io_A,
  input  [7:0] io_B,
  output [7:0] io_C
);
  assign io_C = io_A + io_B; // @[Adder.scala 15:16]
endmodule
module Subber(
  input  [7:0] io_A,
  input  [7:0] io_B,
  output [7:0] io_C
);
  assign io_C = io_A - io_B; // @[Subber.scala 13:16]
endmodule
module Mult(
  input  [7:0] io_A,
  input  [7:0] io_B,
  output [7:0] io_C
);
  wire [15:0] _io_C_T = io_A * io_B; // @[Mult.scala 15:16]
  assign io_C = _io_C_T[7:0]; // @[Mult.scala 15:8]
endmodule
module Div(
  input  [7:0] io_A,
  input  [7:0] io_B,
  output [7:0] io_C
);
  assign io_C = io_A / io_B; // @[Div.scala 14:16]
endmodule
module Alu(
  input        clock,
  input        reset,
  input  [1:0] io_sel,
  input  [7:0] io_A,
  input  [7:0] io_B,
  output [7:0] io_C
);
  wire [7:0] adder_io_A; // @[Alu.scala 16:21]
  wire [7:0] adder_io_B; // @[Alu.scala 16:21]
  wire [7:0] adder_io_C; // @[Alu.scala 16:21]
  wire [7:0] subber_io_A; // @[Alu.scala 17:22]
  wire [7:0] subber_io_B; // @[Alu.scala 17:22]
  wire [7:0] subber_io_C; // @[Alu.scala 17:22]
  wire [7:0] mult_io_A; // @[Alu.scala 18:20]
  wire [7:0] mult_io_B; // @[Alu.scala 18:20]
  wire [7:0] mult_io_C; // @[Alu.scala 18:20]
  wire [7:0] div_io_A; // @[Alu.scala 19:19]
  wire [7:0] div_io_B; // @[Alu.scala 19:19]
  wire [7:0] div_io_C; // @[Alu.scala 19:19]
  wire [7:0] outputDiv = div_io_C; // @[Alu.scala 24:27 47:14]
  wire [7:0] _GEN_0 = 2'h3 == io_sel ? outputDiv : 8'h0; // @[Alu.scala 49:19 53:21 30:8]
  wire [7:0] outputMult = mult_io_C; // @[Alu.scala 23:27 43:15]
  wire [7:0] _GEN_1 = 2'h2 == io_sel ? outputMult : _GEN_0; // @[Alu.scala 49:19 52:21]
  wire [7:0] outputSubber = subber_io_C; // @[Alu.scala 22:27 39:17]
  wire [7:0] _GEN_2 = 2'h1 == io_sel ? outputSubber : _GEN_1; // @[Alu.scala 49:19 51:21]
  wire [7:0] outputAdder = adder_io_C; // @[Alu.scala 21:27 35:15]
  Adder adder ( // @[Alu.scala 16:21]
    .io_A(adder_io_A),
    .io_B(adder_io_B),
    .io_C(adder_io_C)
  );
  Subber subber ( // @[Alu.scala 17:22]
    .io_A(subber_io_A),
    .io_B(subber_io_B),
    .io_C(subber_io_C)
  );
  Mult mult ( // @[Alu.scala 18:20]
    .io_A(mult_io_A),
    .io_B(mult_io_B),
    .io_C(mult_io_C)
  );
  Div div ( // @[Alu.scala 19:19]
    .io_A(div_io_A),
    .io_B(div_io_B),
    .io_C(div_io_C)
  );
  assign io_C = 2'h0 == io_sel ? outputAdder : _GEN_2; // @[Alu.scala 49:19 50:21]
  assign adder_io_A = io_A; // @[Alu.scala 33:15]
  assign adder_io_B = io_B; // @[Alu.scala 34:15]
  assign subber_io_A = io_A; // @[Alu.scala 37:17]
  assign subber_io_B = io_B; // @[Alu.scala 38:17]
  assign mult_io_A = io_A; // @[Alu.scala 41:15]
  assign mult_io_B = io_B; // @[Alu.scala 42:15]
  assign div_io_A = io_A; // @[Alu.scala 45:14]
  assign div_io_B = io_B; // @[Alu.scala 46:14]
endmodule
