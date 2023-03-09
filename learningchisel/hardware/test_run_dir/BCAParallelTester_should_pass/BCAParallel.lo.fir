circuit BCAParallel :
  module FullAdder :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<1>
    input io_B : UInt<1>
    input io_C : UInt<1>
    output io_Sum : UInt<1>
    output io_Carry : UInt<1>

    node _s1_T = cat(UInt<1>("h0"), io_A) @[Cat.scala 33:92]
    node _s1_T_1 = cat(UInt<1>("h0"), io_B) @[Cat.scala 33:92]
    node _s1_T_2 = add(_s1_T, _s1_T_1) @[FullAdder.scala 18:23]
    node _s1_T_3 = tail(_s1_T_2, 1) @[FullAdder.scala 18:23]
    node _s1_T_4 = cat(UInt<1>("h0"), io_C) @[Cat.scala 33:92]
    node _s1_T_5 = add(_s1_T_3, _s1_T_4) @[FullAdder.scala 18:39]
    node _s1_T_6 = tail(_s1_T_5, 1) @[FullAdder.scala 18:39]
    node s1 = _s1_T_6 @[FullAdder.scala 17:23 18:6]
    node _io_Sum_T = bits(s1, 0, 0) @[FullAdder.scala 19:15]
    node _io_Carry_T = bits(s1, 1, 1) @[FullAdder.scala 20:17]
    io_Sum <= _io_Sum_T @[FullAdder.scala 19:10]
    io_Carry <= _io_Carry_T @[FullAdder.scala 20:12]

  module RCA :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<4>
    input io_B : UInt<4>
    input io_C : UInt<1>
    output io_Sum : UInt<4>
    output io_Carry : UInt<1>

    inst fa1 of FullAdder @[RCA.scala 17:19]
    inst fa2 of FullAdder @[RCA.scala 18:19]
    inst fa3 of FullAdder @[RCA.scala 19:19]
    inst fa4 of FullAdder @[RCA.scala 20:19]
    node _fa1_io_A_T = bits(io_A, 0, 0) @[RCA.scala 22:19]
    node _fa1_io_B_T = bits(io_B, 0, 0) @[RCA.scala 23:19]
    node _fa2_io_A_T = bits(io_A, 1, 1) @[RCA.scala 26:19]
    node _fa2_io_B_T = bits(io_B, 1, 1) @[RCA.scala 27:19]
    node _fa3_io_A_T = bits(io_A, 2, 2) @[RCA.scala 30:19]
    node _fa3_io_B_T = bits(io_B, 2, 2) @[RCA.scala 31:19]
    node _fa4_io_A_T = bits(io_A, 3, 3) @[RCA.scala 34:19]
    node _fa4_io_B_T = bits(io_B, 3, 3) @[RCA.scala 35:19]
    node io_Sum_lo = cat(fa2.io_Sum, fa1.io_Sum) @[Cat.scala 33:92]
    node io_Sum_hi = cat(fa4.io_Sum, fa3.io_Sum) @[Cat.scala 33:92]
    node _io_Sum_T = cat(io_Sum_hi, io_Sum_lo) @[Cat.scala 33:92]
    io_Sum <= _io_Sum_T @[RCA.scala 39:10]
    io_Carry <= fa4.io_Carry @[RCA.scala 37:12]
    fa1.clock <= clock
    fa1.reset <= reset
    fa1.io_A <= _fa1_io_A_T @[RCA.scala 22:12]
    fa1.io_B <= _fa1_io_B_T @[RCA.scala 23:12]
    fa1.io_C <= io_C @[RCA.scala 24:12]
    fa2.clock <= clock
    fa2.reset <= reset
    fa2.io_A <= _fa2_io_A_T @[RCA.scala 26:12]
    fa2.io_B <= _fa2_io_B_T @[RCA.scala 27:12]
    fa2.io_C <= fa1.io_Carry @[RCA.scala 28:12]
    fa3.clock <= clock
    fa3.reset <= reset
    fa3.io_A <= _fa3_io_A_T @[RCA.scala 30:12]
    fa3.io_B <= _fa3_io_B_T @[RCA.scala 31:12]
    fa3.io_C <= fa2.io_Carry @[RCA.scala 32:12]
    fa4.clock <= clock
    fa4.reset <= reset
    fa4.io_A <= _fa4_io_A_T @[RCA.scala 34:12]
    fa4.io_B <= _fa4_io_B_T @[RCA.scala 35:12]
    fa4.io_C <= fa3.io_Carry @[RCA.scala 36:12]

  module BCASerial :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<4>
    input io_B : UInt<4>
    input io_C : UInt<1>
    output io_Sum : UInt<4>
    output io_Carry : UInt<1>

    inst rca1 of RCA @[BCASerial.scala 17:20]
    inst rca2 of RCA @[BCASerial.scala 18:20]
    node rca1_sum = rca1.io_Sum @[BCASerial.scala 20:22 30:12]
    node _and1_T = bits(rca1_sum, 3, 3) @[BCASerial.scala 33:19]
    node _and1_T_1 = bits(rca1_sum, 2, 2) @[BCASerial.scala 33:33]
    node _and1_T_2 = and(_and1_T, _and1_T_1) @[BCASerial.scala 33:23]
    node _and2_T = bits(rca1_sum, 3, 3) @[BCASerial.scala 34:19]
    node _and2_T_1 = bits(rca1_sum, 1, 1) @[BCASerial.scala 34:33]
    node _and2_T_2 = and(_and2_T, _and2_T_1) @[BCASerial.scala 34:23]
    node and1 = _and1_T_2 @[BCASerial.scala 22:18 33:8]
    node and2 = _and2_T_2 @[BCASerial.scala 23:18 34:8]
    node _or1_T = or(and1, and2) @[BCASerial.scala 35:15]
    node rca1_carry = rca1.io_Carry @[BCASerial.scala 21:24 31:14]
    node _or1_T_1 = or(_or1_T, rca1_carry) @[BCASerial.scala 35:22]
    node or1 = _or1_T_1 @[BCASerial.scala 24:17 35:7]
    node second_input_lo = cat(or1, UInt<1>("h0")) @[Cat.scala 33:92]
    node second_input_hi = cat(UInt<1>("h0"), or1) @[Cat.scala 33:92]
    node _second_input_T = cat(second_input_hi, second_input_lo) @[Cat.scala 33:92]
    node second_input = _second_input_T @[BCASerial.scala 25:26 36:16]
    io_Sum <= rca2.io_Sum @[BCASerial.scala 41:10]
    io_Carry <= or1 @[BCASerial.scala 42:12]
    rca1.clock <= clock
    rca1.reset <= reset
    rca1.io_A <= io_A @[BCASerial.scala 27:13]
    rca1.io_B <= io_B @[BCASerial.scala 28:13]
    rca1.io_C <= io_C @[BCASerial.scala 29:13]
    rca2.clock <= clock
    rca2.reset <= reset
    rca2.io_A <= second_input @[BCASerial.scala 38:13]
    rca2.io_B <= rca1_sum @[BCASerial.scala 39:13]
    rca2.io_C <= UInt<1>("h0") @[BCASerial.scala 40:13]

  module BCAParallel :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<16>
    input io_B : UInt<16>
    input io_C : UInt<1>
    output io_Sum : UInt<16>
    output io_Carry : UInt<1>

    inst bca1 of BCASerial @[BCAParallel.scala 17:20]
    inst bca2 of BCASerial @[BCAParallel.scala 18:20]
    inst bca3 of BCASerial @[BCAParallel.scala 19:20]
    inst bca4 of BCASerial @[BCAParallel.scala 20:20]
    node _bca1_io_A_T = bits(io_A, 3, 0) @[BCAParallel.scala 29:20]
    node _bca1_io_B_T = bits(io_B, 3, 0) @[BCAParallel.scala 30:20]
    node _bca2_io_A_T = bits(io_A, 7, 4) @[BCAParallel.scala 37:20]
    node _bca2_io_B_T = bits(io_B, 7, 4) @[BCAParallel.scala 38:20]
    node _bca3_io_A_T = bits(io_A, 11, 8) @[BCAParallel.scala 44:20]
    node _bca3_io_B_T = bits(io_B, 11, 8) @[BCAParallel.scala 45:20]
    node _bca4_io_A_T = bits(io_A, 15, 12) @[BCAParallel.scala 50:20]
    node _bca4_io_B_T = bits(io_B, 15, 12) @[BCAParallel.scala 51:20]
    node io_Sum_lo = cat(bca2.io_Sum, bca1.io_Sum) @[Cat.scala 33:92]
    node io_Sum_hi = cat(bca4.io_Sum, bca3.io_Sum) @[Cat.scala 33:92]
    node _io_Sum_T = cat(io_Sum_hi, io_Sum_lo) @[Cat.scala 33:92]
    node carry1 = bca1.io_Carry @[BCAParallel.scala 21:20 32:10]
    node carry2 = bca2.io_Carry @[BCAParallel.scala 22:20 40:10]
    node carry3 = bca3.io_Carry @[BCAParallel.scala 23:20 47:10]
    node sum1 = bca1.io_Sum @[BCAParallel.scala 24:18 33:8]
    node sum2 = bca2.io_Sum @[BCAParallel.scala 25:18 41:8]
    node sum3 = bca3.io_Sum @[BCAParallel.scala 26:18 48:8]
    node sum4 = bca4.io_Sum @[BCAParallel.scala 27:18 54:8]
    io_Sum <= _io_Sum_T @[BCAParallel.scala 58:10]
    io_Carry <= bca4.io_Carry @[BCAParallel.scala 53:12]
    bca1.clock <= clock
    bca1.reset <= reset
    bca1.io_A <= _bca1_io_A_T @[BCAParallel.scala 29:13]
    bca1.io_B <= _bca1_io_B_T @[BCAParallel.scala 30:13]
    bca1.io_C <= io_C @[BCAParallel.scala 31:13]
    bca2.clock <= clock
    bca2.reset <= reset
    bca2.io_A <= _bca2_io_A_T @[BCAParallel.scala 37:13]
    bca2.io_B <= _bca2_io_B_T @[BCAParallel.scala 38:13]
    bca2.io_C <= carry1 @[BCAParallel.scala 39:13]
    bca3.clock <= clock
    bca3.reset <= reset
    bca3.io_A <= _bca3_io_A_T @[BCAParallel.scala 44:13]
    bca3.io_B <= _bca3_io_B_T @[BCAParallel.scala 45:13]
    bca3.io_C <= carry2 @[BCAParallel.scala 46:13]
    bca4.clock <= clock
    bca4.reset <= reset
    bca4.io_A <= _bca4_io_A_T @[BCAParallel.scala 50:13]
    bca4.io_B <= _bca4_io_B_T @[BCAParallel.scala 51:13]
    bca4.io_C <= carry3 @[BCAParallel.scala 52:13]
