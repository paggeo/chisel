package vlsi2
import chisel3._
import chisel3.util._


class fulladderseq extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val cin = Input(UInt(1.W))
    val sum = Output(UInt(1.W))
    val carry = Output(UInt(1.W))
  })
  // val s1 = Wire(UInt(2.W)) // dataflow
  val s1 = Reg(UInt(2.W)) // posedge clock
  s1 := Cat(0.U,io.a) + Cat(0.U,io.b) + Cat(0.U,io.cin)
  io.sum    := s1(0)
  io.carry  := s1(1)

}
