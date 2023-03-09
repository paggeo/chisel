package adder
import chisel3._
import chisel3.util._
import chisel3.experimental._ 
import adder._

class io_bcaserial extends Bundle{
  val A = Input(UInt(4.W))
  val B = Input(UInt(4.W))
  val C = Input(UInt(1.W))
  val Sum = Output(UInt(4.W))
  val Carry = Output(UInt(1.W))
}

class BCASerial extends Module{
  val io = IO(new io_bcaserial)
  val rca1 = Module(new RCA)
  val rca2 = Module(new RCA)

  val rca1_sum = Wire(UInt(4.W))
  val rca1_carry = Wire(UInt(1.W))
  val and1 = Wire(UInt(1.W))
  val and2 = Wire(UInt(1.W))
  val or1 = Wire(UInt(1.W))
  val second_input = Wire(UInt(4.W))

  rca1.io.A := io.A
  rca1.io.B := io.B
  rca1.io.C := io.C
  rca1_sum := rca1.io.Sum
  rca1_carry := rca1.io.Carry

  and1 := rca1_sum(3) & rca1_sum(2)
  and2 := rca1_sum(3) & rca1_sum(1)
  or1 := and1 | and2 | rca1_carry
  second_input := Cat(0.U,or1,or1,0.U)

  rca2.io.A := second_input
  rca2.io.B := rca1_sum
  rca2.io.C := 0.U
  io.Sum := rca2.io.Sum
  io.Carry :=  or1
  
}
