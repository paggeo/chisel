import chisel3._
import scala.io.Source
import java.io._
import vlsi1._
import vlsi2._


object Main extends App {
  println(
    new (chisel3.stage.ChiselStage).emitVerilog(
      // new shifter,
      new rca,
      Array(
        "--emission-options=disableMemRandomization,disableRegisterRandomization",
        "--target-dir","output/"
      )
    )
  )
}