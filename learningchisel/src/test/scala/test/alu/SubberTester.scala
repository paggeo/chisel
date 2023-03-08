package alu
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import alu._

class SubberTester extends AnyFlatSpec with ChiselScalatestTester{
  "Subber" should "pass" in {
    test(new Subber(8)){ dut =>
      for (a <- 5 to 8){
        for ( b <- 0 to 4){
          val result = a - b
          dut.io.A.poke(a.U)
          dut.io.B.poke(b.U)
          dut.clock.step(1)
          val c = dut.io.C.peek().litValue
          dut.io.C.expect(result.U)
          println(f"a: $a%5d, b: $b%5d, actural result: $c%5d, expected result: $result%5d")
        }
      }
    }
  }
}