package adder
import chisel3._
import chisel3.util._
import chisel3.experimental._ 
import adder._

class io_fulladder extends Bundle{
  val A = Input(UInt(1.W))
  val B = Input(UInt(1.W))
  val C = Input(UInt(1.W))
  val Sum = Output(UInt(1.W))
  val Carry = Output(UInt(1.W))
}

class FullAdder extends Module{
  val io = IO(new io_fulladder)
  val s1 : UInt = Wire(UInt(2.W))
  s1 := Cat(0.U,io.A) + Cat(0.U,io.B) + Cat(0.U,io.C)
  io.Sum := s1(0)
  io.Carry := s1(1)
}
