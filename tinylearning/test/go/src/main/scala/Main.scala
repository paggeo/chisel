import chisel3._
import scala.io.Source
import java.io._
import vlsi1._
import vlsi2._
import java.io._


object Main extends App {
  val writer = new PrintWriter(new File("test.txt" ))
  writer.write(new (chisel3.stage.ChiselStage).emitVerilog(
      // new shifter,
      new rca,
      Array("--emission-options=disableMemRandomization,disableRegisterRandomization","--target-dir","output/")
    )
  )
  writer.close()
}