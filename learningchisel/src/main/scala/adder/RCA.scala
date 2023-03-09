package adder
import chisel3._
import chisel3.util._
import chisel3.experimental._ 
import adder._

class io_rca extends Bundle{
  val A = Input(UInt(4.W))
  val B = Input(UInt(4.W))
  val C = Input(UInt(1.W))
  val Sum = Output(UInt(4.W))
  val Carry = Output(UInt(1.W))
}

class RCA extends Module{
  val io = IO(new io_rca)
  val fa1 = Module(new FullAdder)
  val fa2 = Module(new FullAdder)
  val fa3 = Module(new FullAdder)
  val fa4 = Module(new FullAdder)

  fa1.io.A := io.A(0)
  fa1.io.B := io.B(0)
  fa1.io.C := io.C

  fa2.io.A := io.A(1)
  fa2.io.B := io.B(1)
  fa2.io.C := fa1.io.Carry

  fa3.io.A := io.A(2)
  fa3.io.B := io.B(2)
  fa3.io.C := fa2.io.Carry
  
  fa4.io.A := io.A(3)
  fa4.io.B := io.B(3)
  fa4.io.C := fa3.io.Carry
  io.Carry := fa4.io.Carry

  io.Sum := Cat(fa4.io.Sum,fa3.io.Sum,fa2.io.Sum,fa1.io.Sum)
  
}
