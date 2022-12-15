package vlsi1
import chisel3._
import chisel3.util._

class counter extends Module{
  val io = IO(new Bundle{
    val counter_direction = Input(Bool()) // 1 : up | 0 : down
    val enable = Input(Bool())
    val output_bit  = Output(UInt(4.W))
  })
  val counter = RegInit(0.U(4.W))

  when(io.enable){
    when (io.counter_direction){
      counter := counter + 1.U
    }.otherwise{
      counter := counter - 1.U
    }
  }.otherwise{
    counter := counter
  }
  io.output_bit := counter
}

class counter_modulo extends Module{
  val io = IO(new Bundle{
    val modulo = Input(UInt(4.W)) 
    val enable = Input(Bool())
    val output_bit  = Output(UInt(4.W))
  })
  val counter = RegInit(0.U(4.W))

  when(io.enable){
    when(counter === io.modulo){
      counter := RegInit(1.U(4.W)) 
    }.otherwise{
      counter := counter + 1.U
    }
  }.otherwise{
    counter := counter
  }
  io.output_bit := counter
}