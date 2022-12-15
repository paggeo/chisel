package users
import chisel3._

class Adder(val n: Int) extends Module{
  val io = IO(new Bundle{
    val A = Input(UInt(n.W))
    val B = Input(UInt(n.W))
    val C = Output(UInt(n.W))
  })
  io.C := io.A + io.B
}