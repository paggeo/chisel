package alu
import chisel3._
import alu._

class io_subber extends Bundle{
  val A = Input(UInt(8.W))
  val B = Input(UInt(8.W))
  val C = Output(UInt(8.W))
}

class Subber(val n: Int) extends Module{
  val io = IO(new io_subber)
  io.C := io.A - io.B
}