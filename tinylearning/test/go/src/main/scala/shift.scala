package vlsi1
import chisel3._
import chisel3.util._

class shifter extends Module{
  val io = IO(new Bundle{
    val input_bit = Input(UInt(1.W))
    val load = Input(Bool())
    val enable = Input(Bool())
    val loading_number = Input(UInt(4.W))
    val shift_direction = Input(Bool()) // 1 :right | 0 : left
    val output_bit  = Output(UInt(1.W))
  })
  val reg = RegInit(0.U(4.W))

  when(io.load === true.B){
    reg := io.loading_number
    io.output_bit := 0.U
  }.elsewhen(io.enable){
    when(io.shift_direction){
      reg := Cat(reg(2,0),io.input_bit)
      io.output_bit := reg(3)
    }.otherwise{
      reg := Cat(io.input_bit,reg(3,1))
      io.output_bit := reg(0)
    }
  }.otherwise {
    io.output_bit := 0.U 
  }
}