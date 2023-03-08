circuit Alu :
  module Adder :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<8>
    input io_B : UInt<8>
    output io_C : UInt<8>

    node _io_C_T = add(io_A, io_B) @[Adder.scala 15:16]
    node _io_C_T_1 = tail(_io_C_T, 1) @[Adder.scala 15:16]
    io_C <= _io_C_T_1 @[Adder.scala 15:8]

  module Subber :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<8>
    input io_B : UInt<8>
    output io_C : UInt<8>

    node _io_C_T = sub(io_A, io_B) @[Subber.scala 13:16]
    node _io_C_T_1 = tail(_io_C_T, 1) @[Subber.scala 13:16]
    io_C <= _io_C_T_1 @[Subber.scala 13:8]

  module Mult :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<8>
    input io_B : UInt<8>
    output io_C : UInt<8>

    node _io_C_T = mul(io_A, io_B) @[Mult.scala 15:16]
    io_C <= bits(_io_C_T, 7, 0) @[Mult.scala 15:8]

  module Div :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<8>
    input io_B : UInt<8>
    output io_C : UInt<8>

    node _io_C_T = div(io_A, io_B) @[Div.scala 14:16]
    io_C <= _io_C_T @[Div.scala 14:8]

  module Alu :
    input clock : Clock
    input reset : UInt<1>
    input io_sel : UInt<2>
    input io_A : UInt<8>
    input io_B : UInt<8>
    output io_C : UInt<8>

    inst adder of Adder @[Alu.scala 16:21]
    inst subber of Subber @[Alu.scala 17:22]
    inst mult of Mult @[Alu.scala 18:20]
    inst div of Div @[Alu.scala 19:19]
    node _T = eq(UInt<1>("h0"), io_sel) @[Alu.scala 49:19]
    node _T_1 = eq(UInt<1>("h1"), io_sel) @[Alu.scala 49:19]
    node _T_2 = eq(UInt<2>("h2"), io_sel) @[Alu.scala 49:19]
    node _T_3 = eq(UInt<2>("h3"), io_sel) @[Alu.scala 49:19]
    node outputDiv = div.io_C @[Alu.scala 24:27 47:14]
    node _GEN_0 = mux(_T_3, outputDiv, UInt<1>("h0")) @[Alu.scala 49:19 53:21 30:8]
    node outputMult = mult.io_C @[Alu.scala 23:27 43:15]
    node _GEN_1 = mux(_T_2, outputMult, _GEN_0) @[Alu.scala 49:19 52:21]
    node outputSubber = subber.io_C @[Alu.scala 22:27 39:17]
    node _GEN_2 = mux(_T_1, outputSubber, _GEN_1) @[Alu.scala 49:19 51:21]
    node outputAdder = adder.io_C @[Alu.scala 21:27 35:15]
    node _GEN_3 = mux(_T, outputAdder, _GEN_2) @[Alu.scala 49:19 50:21]
    io_C <= _GEN_3
    adder.clock <= clock
    adder.reset <= reset
    adder.io_A <= io_A @[Alu.scala 33:15]
    adder.io_B <= io_B @[Alu.scala 34:15]
    subber.clock <= clock
    subber.reset <= reset
    subber.io_A <= io_A @[Alu.scala 37:17]
    subber.io_B <= io_B @[Alu.scala 38:17]
    mult.clock <= clock
    mult.reset <= reset
    mult.io_A <= io_A @[Alu.scala 41:15]
    mult.io_B <= io_B @[Alu.scala 42:15]
    div.clock <= clock
    div.reset <= reset
    div.io_A <= io_A @[Alu.scala 45:14]
    div.io_B <= io_B @[Alu.scala 46:14]
