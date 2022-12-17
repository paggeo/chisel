package vlsi2
import chisel3._
import chisel3.util._
import vlsi2.halfadder


class fulladder extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val cin = Input(UInt(1.W))
    val sum = Output(UInt(1.W))
    val carry = Output(UInt(1.W))
  })
  val s1 = Wire(UInt(1.W))
  val c1 = Wire(UInt(1.W))
  val c2 = Wire(UInt(1.W))

  val h0 = Module(new halfadder)
  h0.io.a := io.a
  h0.io.b := io.b
  h0.io.sum <> s1
  h0.io.carry <> c1

  val h1 = Module(new halfadder)
  h1.io.a <> s1
  h1.io.b := io.cin
  h1.io.sum <> io.sum
  h1.io.carry <> c2
  
  io.carry := c1 | c2
}
