package dec_mux
import chisel3._
import chisel3.util._
import chisel3.experimental._ 
import dec_mux._

class io_mux extends Bundle{
  val sel = Input(UInt(1.W))
  val A = Input(UInt(8.W))
  val B = Input(UInt(8.W))
  val C = Output(UInt(8.W))
}

class Mux2_1 extends Module{
  val io = IO(new io_mux{})
  // io.C := Mux(io.S, io.B, io.A) // built-in Mux
  io.C := 0.U
  switch(io.sel){
    is(0.U){io.C := io.A}
    is(1.U){io.C := io.B}
  }
}