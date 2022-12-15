import chisel3._
import scala.io.Source
import java.io._
import users.Adder


object Main extends App {
  // val file = "./src/main/scala/test.txt" 
  // val testTxtSource = scala.io.Source.fromFile(file)

  // val str = testTxtSource.mkString
  // println(str)
  
  val file = "./src/main/scala/verilog.v" 
  val fileWriter = new FileWriter(new File(file))
  fileWriter.write(
    new (chisel3.stage.ChiselStage).emitVerilog(
      new Adder(3),
      Array(
        "--emission-options=disableMemRandomization,disableRegisterRandomization"
      )
    )
  )
  fileWriter.close()

  // println(
  //   new (chisel3.stage.ChiselStage).emitVerilog(
  //     new Adder(3),
  //     Array(
  //       "--emission-options=disableMemRandomization,disableRegisterRandomization"
  //     )
  //   )
  // )
}