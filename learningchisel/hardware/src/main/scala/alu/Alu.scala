package alu
import chisel3._
import chisel3.util._
import chisel3.experimental._ 
import alu._

class io_alu extends Bundle{
  val sel = Input(UInt(2.W))
  val A = Input(UInt(8.W))
  val B = Input(UInt(8.W))
  val C = Output(UInt(8.W))
}

class Alu(val n: Int) extends Module{
  val io = IO(new io_alu)
  val adder = Module(new Adder(n))
  val subber = Module(new Subber(n))
  val mult = Module(new Mult(n))
  val div = Module(new Div(n))

  val outputAdder   = Wire(UInt(n.W))
  val outputSubber  = Wire(UInt(n.W))
  val outputMult    = Wire(UInt(n.W))
  val outputDiv     = Wire(UInt(n.W))

  outputAdder   := 0.U
  outputSubber  := 0.U
  outputMult    := 0.U
  outputDiv     := 0.U
  io.C := 0.U  


  adder.io.A  <> io.A
  adder.io.B  <> io.B
  outputAdder <> adder.io.C

  subber.io.A   <> io.A
  subber.io.B   <> io.B
  outputSubber  <> subber.io.C

  mult.io.A   <> io.A
  mult.io.B   <> io.B
  outputMult  <> mult.io.C

  div.io.A   <> io.A
  div.io.B   <> io.B
  outputDiv  <> div.io.C

  switch (io.sel) {
    is (0.U) { io.C := outputAdder}
    is (1.U) { io.C := outputSubber}
    is (2.U) { io.C := outputMult}
    is (3.U) { io.C := outputDiv}
  }

}

// class CaseStatementModule extends Module { 
//   val sel = IO(Input(UInt(2.W))) 
//   val out = IO(Output(UInt(4.W))) // default goes first 
//   out := 0.U
//   switch (sel) {
//     is ("b00".U) { out := "b0001".U}
//     is ("b01".U) { out := "b0010".U}
//     is ("b10".U) { out := "b0100".U}
//     is ("b11".U) { out := "b1000".U}
//   }
// }