package adder
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import adder._

class BCAParallelTester extends AnyFlatSpec with ChiselScalatestTester{
  "BCAParallelTester" should "pass" in {
    test(new BCAParallel){ dut =>
      for (a <- 1020 to 1024){
        for (b <- 0 to 8){
          for (c <- 0 to 1){
            dut.io.A.poke(a.U)
            dut.io.B.poke(b.U)
            dut.io.C.poke(c.U)
            dut.clock.step(1)
            val Sum = dut.io.Sum.peek().litValue
            val Carry = dut.io.Carry.peek().litValue
            println(f"a: ${a.toBinaryString}%16s b: ${b.toBinaryString}%16s  c: $c  Carry: $Carry  Sum: ${Sum.toString(2)}%16s")
          }
        }
        println("=====================================")
      }
    }
  }
}