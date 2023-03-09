package adder
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import adder._

class HalfAdderTester extends AnyFlatSpec with ChiselScalatestTester{
  "HalfAdder" should "pass" in {
    test(new HalfAdder){ dut =>
      for (a <- 0 to 1){
        for ( b <- 0 to 1){
          dut.io.A.poke(a.U)
          dut.io.B.poke(b.U)
          dut.clock.step(1)
          val Sum = dut.io.Sum.peek().litValue
          val Carry = dut.io.Carry.peek().litValue
          println(s"a: $a, b: $b, Sum: $Sum, Carry: $Carry")
        }
      }
    }
  }
}