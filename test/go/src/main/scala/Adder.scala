package users
import chisel3._

import chisel3.util.{switch, is}

class Adder(val n: Int) extends Module{
  val io = IO(new Bundle{
    val A = Input(UInt(n.W))
    val B = Input(UInt(n.W))
    val C = Output(UInt(n.W))
  })
  io.C := io.A + io.B
}


class CaseStatementModule extends Module { 
  val sel = IO(Input(UInt(2.W))) 
  val out = IO(Output(UInt(4.W))) // default goes first 
  
  out := 0.U
  switch (sel) {
    is ("b00".U) { out := "b0001".U}
    is ("b01".U) { out := "b0010".U}
    is ("b10".U) { out := "b0100".U}
    is ("b11".U) { out := "b1000".U}
  }
  
}