circuit Dec :
  module Dec :
    input clock : Clock
    input reset : UInt<1>
    input io_input : UInt<3>
    output io_output : UInt<8>

    node _T = eq(UInt<1>("h0"), io_input) @[dec.scala 15:20]
    node _T_1 = eq(UInt<1>("h1"), io_input) @[dec.scala 15:20]
    node _T_2 = eq(UInt<2>("h2"), io_input) @[dec.scala 15:20]
    node _T_3 = eq(UInt<2>("h3"), io_input) @[dec.scala 15:20]
    node _T_4 = eq(UInt<3>("h4"), io_input) @[dec.scala 15:20]
    node _T_5 = eq(UInt<3>("h5"), io_input) @[dec.scala 15:20]
    node _T_6 = eq(UInt<3>("h6"), io_input) @[dec.scala 15:20]
    node _T_7 = eq(UInt<3>("h7"), io_input) @[dec.scala 15:20]
    node _GEN_0 = mux(_T_7, UInt<8>("h80"), UInt<1>("h0")) @[dec.scala 14:13 15:20 23:29]
    node _GEN_1 = mux(_T_6, UInt<7>("h40"), _GEN_0) @[dec.scala 15:20 22:29]
    node _GEN_2 = mux(_T_5, UInt<6>("h20"), _GEN_1) @[dec.scala 15:20 21:29]
    node _GEN_3 = mux(_T_4, UInt<5>("h10"), _GEN_2) @[dec.scala 15:20 20:29]
    node _GEN_4 = mux(_T_3, UInt<4>("h8"), _GEN_3) @[dec.scala 15:20 19:29]
    node _GEN_5 = mux(_T_2, UInt<3>("h4"), _GEN_4) @[dec.scala 15:20 18:29]
    node _GEN_6 = mux(_T_1, UInt<2>("h2"), _GEN_5) @[dec.scala 15:20 17:29]
    node _GEN_7 = mux(_T, UInt<1>("h1"), _GEN_6) @[dec.scala 15:20 16:29]
    io_output <= _GEN_7
