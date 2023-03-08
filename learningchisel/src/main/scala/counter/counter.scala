package counter
import chisel3._
import chisel3.util._
import chisel3.experimental._ 
import counter._


class io_counter(size : Int) extends Bundle{
  val en = Input(Bool())
  val out = Output(UInt(size.W))
}

class Counter_en(size : Int) extends Module{
  val io = IO(new io_counter(size))
  val count = RegInit(0.U(size.W))
  when(io.en){
    count := count + 1.U
  }
  io.out := count
}