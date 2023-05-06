package adder
import chisel3._
import chisel3.util._
import chisel3.experimental._ 
import adder._

class io_halfadder extends Bundle{
  val A = Input(UInt(1.W))
  val B = Input(UInt(1.W))
  val Sum = Output(UInt(1.W))
  val Carry = Output(UInt(1.W))
}

class HalfAdder extends Module{
  val io = IO(new io_halfadder)
  io.Sum := io.A ^ io.B
  io.Carry := io.A & io.B
}