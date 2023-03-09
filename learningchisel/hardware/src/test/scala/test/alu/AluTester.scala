package alu
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import alu._

class AluTester extends AnyFlatSpec with ChiselScalatestTester{
  "AluTester" should "pass" in {
    test(new Alu(8)){ dut =>
      for (op <- 0 to 3){
        for (a <- 5 to 8){
          for ( b <- 1 to 4){
            val result = op match {
              case 0 => a + b
              case 1 => a - b
              case 2 => a * b
              case 3 => a / b
            }
            dut.io.A.poke(a.U)
            dut.io.B.poke(b.U)
            dut.io.sel.poke(op.U)
            dut.clock.step(1)
            val c = dut.io.C.peek().litValue
            dut.io.C.expect(result.U)
            val op_str = op match {
              case 0 => "add"
              case 1 => "sub"
              case 2 => "mul"
              case 3 => "div"
            } 
            println(f"op: $op_str%5s, a: $a%5d, b: $b%5d, actural result: $c%5d, expected result: $result%5d")
          }
        }
        println("=====================================")
      }
    }
  }
}
// class AluTester extends AnyFlatSpec with ChiselScalatestTester{
//   "AluTester " should "pass" in {
//     test(new Alu(8)){ dut =>
//       for (a <- 0 to 15){
//         for ( b <- 0 to 15){
//           for (op <- 0 to 1){
//             val result = op match {
//               case 0 => a + b
//               case 1 => a - b
//             }
//             dut.io.A.poke(a.U)
//             dut.io.B.poke(b.U)
//             dut.io.sel.poke(op.U)
//             dut.clock.step(1)
//             dut.io.C.expect(result.U)
//             println(s"op: $op, a: $a, b: $b, result: $result")
//           }
//         }
//       }
//     }
//   }
// }