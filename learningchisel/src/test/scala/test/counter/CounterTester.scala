package counter
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import counter._

class CounterTester extends AnyFlatSpec with ChiselScalatestTester{
  "Dec" should "pass" in {
    test(new Counter_en(10)){ dut =>
      for (step <- 0 to 7){
        dut.io.en.poke(true.B)
        dut.clock.step(1)
        val out = dut.io.out.peek().litValue
        println(f"step $step%5d, out $out%5d")
      }
      for(step <- 0 to 1){
        dut.io.en.poke(false.B)
        dut.clock.step(1)
        val out = dut.io.out.peek().litValue
        println(f"step $step%5d, out $out%5d")
      }
    }
  }
}