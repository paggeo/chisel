package vlsi1
import chisel3._
import chisel3.util.{switch, is}

class Dec extends Module{
  val io = IO(new Bundle{
    val enc = Input(UInt(3.W))
    val dec = Output(UInt(math.pow(2,3).toInt.W))
  })

  io.dec := 0.U
  switch (io.enc){
    is("b000".U) {io.dec := "b00000001".U}
    is("b001".U) {io.dec := "b00000010".U}
    is("b010".U) {io.dec := "b00000100".U}
    is("b011".U) {io.dec := "b00001000".U}
    is("b100".U) {io.dec := "b00010000".U}
    is("b101".U) {io.dec := "b00100000".U}
    is("b110".U) {io.dec := "b01000000".U}
    is("b111".U) {io.dec := "b10000000".U}
  }
}