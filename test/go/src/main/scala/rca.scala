package vlsi2
import chisel3._
import chisel3.util._
import vlsi2.fulladder

class shiftbool extends Module{

  val io = IO(new Bundle{
    val a = Input(UInt(1.W))
    val b = Output(UInt(1.W))
  })

  val reg = Reg(UInt(3.W))
  reg := Cat(reg(1,0),io.a)
  io.b := reg(2)
}

class rca extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(4.W))
    val b = Input(UInt(4.W))
    val cin = Input(UInt(1.W))
    val sum = Output(UInt(4.W))
    val carry = Output(UInt(1.W))
  })
  val s1 = Reg(UInt(2.W)) // posedge clock


  val c1,c2,c3 = Wire(UInt(1.W))
  val s0_0,s1_1,s2_2 = Wire(UInt(1.W))

  // sequential for the carries
  val c_3 = Reg(UInt(3.W))
  c_3 := Cat(c3,c2,c1)

  // S_1 
  val register_s1 = Reg(UInt(4.W))
  register_s1 := Cat(register_s1(2,0),s0_0)

  // io.sum(0) := register_s1(3)

  // S_2
  val register_s2_a = Reg(UInt(2.W))
  val register_s2_b = Reg(UInt(2.W))
  val register_s2 = Reg(UInt(3.W))
  register_s2_a := Cat(register_s2_a(0),io.a(1))
  register_s2_b := Cat(register_s2_b(0),io.b(1))
  register_s2 := Cat(register_s2(1,0),s1_1)
  // io.sum(1) := register_s2(2)

  println(s1_1.getClass())

  // S_3 
  val register_s3_a = Reg(UInt(3.W))
  val register_s3_b = Reg(UInt(3.W))
  val register_s3   = Reg(UInt(2.W))
  register_s3_a := Cat(register_s3_a(1,0),io.a(2))
  register_s3_b := Cat(register_s3_b(1,0),io.b(2))
  register_s3   := Cat(register_s3(0),s2_2)
  // io.sum(2)     := register_s3(1)

  // S_4
  val register_s4_a = Reg(UInt(4.W))
  val register_s4_b = Reg(UInt(4.W))
  register_s4_a := Cat(register_s4_a(2,0),io.a(3))
  register_s4_b := Cat(register_s4_b(2,0),io.b(3))

  val fa0 = Module(new fulladder)
  fa0.io.a <> io.a(0)
  fa0.io.b <> io.b(0)
  fa0.io.cin <> io.cin
  fa0.io.sum <> s0_0
  fa0.io.carry <> c1

  val fa1 = Module(new fulladder)
  fa1.io.a <> register_s2_a(1) 
  fa1.io.b <> register_s2_b(1) 
  fa1.io.cin <> c_3(0)
  fa1.io.sum <> s1_1
  fa1.io.carry <> c2

  val fa2 = Module(new fulladder)
  fa2.io.a <> register_s3_a(2) 
  fa2.io.b <> register_s3_b(2) 
  fa2.io.cin <> c_3(1)
  fa2.io.sum <> s2_2
  fa2.io.carry <> c3

  val tmp = Wire(UInt(1.W))
  val fa3 = Module(new fulladder)
  fa3.io.a <> register_s4_a(3) 
  fa3.io.b <> register_s4_b(3)
  fa3.io.cin <> c_3(2)
  fa3.io.sum <> tmp
  fa3.io.carry <> io.carry 

  io.sum := Cat(tmp,register_s3(1),register_s2(2),register_s1(3))
}
