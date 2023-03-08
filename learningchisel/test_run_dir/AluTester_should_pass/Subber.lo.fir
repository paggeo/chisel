circuit Subber :
  module Subber :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<8>
    input io_B : UInt<8>
    output io_C : UInt<8>

    node _io_C_T = sub(io_A, io_B) @[Subber.scala 9:16]
    node _io_C_T_1 = tail(_io_C_T, 1) @[Subber.scala 9:16]
    io_C <= _io_C_T_1 @[Subber.scala 9:8]
