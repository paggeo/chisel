package alu
import chisel3._
import chisel3.util._
import chisel3.experimental._ 
import alu._

class io_div extends Bundle{
  val A = Input(UInt(8.W))
  val B = Input(UInt(8.W))
  val C = Output(UInt(8.W))
}
class Div(val n: Int) extends Module{
  val io = IO(new io_div)
  io.C := io.A / io.B
}

