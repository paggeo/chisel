package accumTable
import chisel3._
import chisel3.util._
import chisel3.experimental._ 

class io_accumCol extends Bundle{
  val clear = Input(UInt(1.W))
  val rd_en = Input(UInt(1.W))
  val wr_en = Input(UInt(1.W))
  val rd_addr = Input(UInt(4.W))
  val wr_addr = Input(UInt(4.W))
  val wr_data = Input(UInt(8.W))
  val rd_data = Output(UInt(8.W))
}

/* Rising Clock everytime in Module*/
class accumCol extends Module{
  val io = IO(new io_accumCol)
  val mem = Mem(16, UInt(8.W))
  io.rd_data := 0.U(8.W) // initialization of output

  when (io.wr_en === 1.U) {mem(io.wr_addr) := mem(io.wr_addr) + io.wr_data}
  when (io.rd_en === 1.U) {io.rd_data := mem(io.rd_addr)}
  
  when (io.clear === 1.U) {
    for (i <- 0 until 16) {mem(i) := 0.U(8.W)}
  }
}