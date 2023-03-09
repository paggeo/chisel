package dec_mux
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import dec_mux._

class DecTester extends AnyFlatSpec with ChiselScalatestTester{
  "Dec" should "pass" in {
    test(new Dec){ dut =>
      for (a <- 0 to 7){
        dut.io.input.poke(a.U)
        dut.clock.step(1)
        val output = dut.io.output.peek().litValue
        println(f"input $a%5d, output $output%5d")
      }
    }
  }
}