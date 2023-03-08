package dec_mux
import chisel3._
import chisel3.util._
import chisel3.experimental._ 
import dec_mux._

class io_dec(val N: Int) extends Bundle{
  val input = Input(UInt(N.W))
  val output = Output(UInt(math.pow(2,N).toInt.W))
}

class Dec extends Module{
  val io = IO(new io_dec(3))
  io.output := 0.U
  switch (io.input){
    is("b000".U) {io.output := "b00000001".U}
    is("b001".U) {io.output := "b00000010".U}
    is("b010".U) {io.output := "b00000100".U}
    is("b011".U) {io.output := "b00001000".U}
    is("b100".U) {io.output := "b00010000".U}
    is("b101".U) {io.output := "b00100000".U}
    is("b110".U) {io.output := "b01000000".U}
    is("b111".U) {io.output := "b10000000".U}
  }
}