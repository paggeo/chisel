package vlsi1
import chisel3._
import chisel3.util._

class shifter extends Module{
  val io = IO(new Bundle{
    val input_bit = Input(UInt(1.W))
    val load = Input(Bool())
    val enable = Input(Bool())
    val loading_number = Input(UInt(4.W))
    val output_bit  = Output(UInt(1.W))
  })
  val reg = RegInit(0.U(4.W))
  // val tmp = Wire(UInt(1.W))
  //io.output_bit := 0.U


  when(io.load === false.B){
    reg := io.loading_number
    // tmp := 0.U
    io.output_bit := 0.U
  }.elsewhen(io.enable){
    reg := Cat(io.input_bit,reg(2,0))
    // tmp := reg(3)
    io.output_bit := reg(3)
  }.otherwise {
    // tmp := 0.U
    io.output_bit := 0.U 
  }
  
  // io.output_bit := tmp

}