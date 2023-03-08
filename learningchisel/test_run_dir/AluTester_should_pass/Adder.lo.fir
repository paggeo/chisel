circuit Adder :
  module Adder :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<8>
    input io_B : UInt<8>
    output io_C : UInt<8>

    node _io_C_T = add(io_A, io_B) @[Adder.scala 11:16]
    node _io_C_T_1 = tail(_io_C_T, 1) @[Adder.scala 11:16]
    io_C <= _io_C_T_1 @[Adder.scala 11:8]
