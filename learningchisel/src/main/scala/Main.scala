import chisel3._
import scala.io.Source
import java.io._
import alu._

object Main extends App {
  println("Hello, World! what no")

  val writer = new PrintWriter(new File("dut.v" ))
  writer.write(new (chisel3.stage.ChiselStage).emitVerilog(
      // new shifter,
      new alu.Alu(8),
      Array("--emission-options=disableMemRandomization,disableRegisterRandomization","--target-dir","output/")
    )
  )
  writer.close()
}