circuit Counter_en :
  module Counter_en :
    input clock : Clock
    input reset : UInt<1>
    input io_en : UInt<1>
    output io_out : UInt<10>

    reg count : UInt<10>, clock with :
      reset => (UInt<1>("h0"), count) @[counter.scala 15:22]
    reg count2 : UInt<10>, clock with :
      reset => (UInt<1>("h0"), count2) @[counter.scala 16:23]
    node _count_T = add(count, UInt<1>("h1")) @[counter.scala 18:20]
    node _count_T_1 = tail(_count_T, 1) @[counter.scala 18:20]
    node _GEN_0 = mux(io_en, _count_T_1, count) @[counter.scala 17:14 18:11 15:22]
    io_out <= count2 @[counter.scala 21:10]
    count <= mux(reset, UInt<10>("h0"), _GEN_0) @[counter.scala 15:{22,22}]
    count2 <= mux(reset, UInt<10>("h0"), count) @[counter.scala 16:{23,23} 20:10]
