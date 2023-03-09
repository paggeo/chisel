package adder
import chisel3._
import chisel3.util._
import chisel3.experimental._ 
import adder._

class io_bcaparallel extends Bundle{
  val A = Input(UInt(16.W))
  val B = Input(UInt(16.W))
  val C = Input(UInt(1.W))
  val Sum = Output(UInt(16.W))
  val Carry = Output(UInt(1.W))
}

class BCAParallel extends Module{
  val io = IO(new io_bcaparallel)
  val bca1 = Module(new BCASerial)
  val bca2 = Module(new BCASerial)
  val bca3 = Module(new BCASerial)
  val bca4 = Module(new BCASerial)
  val carry1 = Wire(UInt(1.W)) 
  val carry2 = Wire(UInt(1.W)) 
  val carry3 = Wire(UInt(1.W))  
  val sum1 = Wire(UInt(4.W)) 
  val sum2 = Wire(UInt(4.W))  
  val sum3 = Wire(UInt(4.W))  
  val sum4 = Wire(UInt(4.W))  

  bca1.io.A := io.A(3,0)
  bca1.io.B := io.B(3,0)
  bca1.io.C := io.C
  carry1 := bca1.io.Carry
  sum1 := bca1.io.Sum
  io.Carry := carry1
  io.Sum := sum1

  bca2.io.A := io.A(7,4)
  bca2.io.B := io.B(7,4)
  bca2.io.C := carry1
  carry2 := bca2.io.Carry
  sum2 := bca2.io.Sum


  bca3.io.A := io.A(11,8)
  bca3.io.B := io.B(11,8)
  bca3.io.C := carry2
  carry3 := bca3.io.Carry
  sum3 := bca3.io.Sum

  bca4.io.A := io.A(15,12)
  bca4.io.B := io.B(15,12)
  bca4.io.C := carry3
  io.Carry := bca4.io.Carry
  sum4 := bca4.io.Sum

  // io.Sum := Cat(sum4,sum3,sum2,sum1)
  // io.Sum := Cat(sum1)
  io.Sum := Cat(bca4.io.Sum,bca3.io.Sum,bca2.io.Sum,bca1.io.Sum)
}
