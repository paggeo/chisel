package dec_mux
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import dec_mux._

class MuxTester extends AnyFlatSpec with ChiselScalatestTester{
  "Mux2_1" should "pass" in {
    test(new Mux2_1){ dut =>
      for (sel <- 0 to 1){
        for (a <- 5 to 8){
          for ( b <- 0 to 4){
            val result = if (sel == 0) a else b
            dut.io.sel.poke(sel.U)
            dut.io.A.poke(a.U)
            dut.io.B.poke(b.U)
            dut.clock.step(1)
            val c = dut.io.C.peek().litValue
            dut.io.C.expect(result.U)
            println(f"sel: $sel%5d, a: $a%5d, b: $b%5d, actural result: $c%5d, expected result: $result%5d")
          }
        }
      }
    }
  }
}