circuit Mux2_1 :
  module Mux2_1 :
    input clock : Clock
    input reset : UInt<1>
    input io_sel : UInt<1>
    input io_A : UInt<8>
    input io_B : UInt<8>
    output io_C : UInt<8>

    node _T = eq(UInt<1>("h0"), io_sel) @[mux.scala 18:17]
    node _T_1 = eq(UInt<1>("h1"), io_sel) @[mux.scala 18:17]
    node _GEN_0 = mux(_T_1, io_B, UInt<1>("h0")) @[mux.scala 18:17 20:18 17:8]
    node _GEN_1 = mux(_T, io_A, _GEN_0) @[mux.scala 18:17 19:18]
    io_C <= _GEN_1
