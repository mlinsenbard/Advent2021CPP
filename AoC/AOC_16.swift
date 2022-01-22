////
////  main.swift
////  AoC
////
////  Created by Max Linsenbard on 12/8/21.
////
//
//import Foundation
//import GameplayKit
//
//let sampleInput = """
//9C0141080250320F1802104A08
//"""
//
//let input = """
//E20D79005573F71DA0054E48527EF97D3004653BB1FC006867A8B1371AC49C801039171941340066E6B99A6A58B8110088BA008CE6F7893D4E6F7893DCDCFDB9D6CBC4026FE8026200DC7D84B1C00010A89507E3CCEE37B592014D3C01491B6697A83CB4F59E5E7FFA5CC66D4BC6F05D3004E6BB742B004E7E6B3375A46CF91D8C027911797589E17920F4009BE72DA8D2E4523DCEE86A8018C4AD3C7F2D2D02C5B9FF53366E3004658DB0012A963891D168801D08480485B005C0010A883116308002171AA24C679E0394EB898023331E60AB401294D98CA6CD8C01D9B349E0A99363003E655D40289CBDBB2F55D25E53ECAF14D9ABBB4CC726F038C011B0044401987D0BE0C00021B04E2546499DE824C015B004A7755B570013F2DD8627C65C02186F2996E9CCD04E5718C5CBCC016B004A4F61B27B0D9B8633F9344D57B0C1D3805537ADFA21F231C6EC9F3D3089FF7CD25E5941200C96801F191C77091238EE13A704A7CCC802B3B00567F192296259ABD9C400282915B9F6E98879823046C0010C626C966A19351EE27DE86C8E6968F2BE3D2008EE540FC01196989CD9410055725480D60025737BA1547D700727B9A89B444971830070401F8D70BA3B8803F16A3FC2D00043621C3B8A733C8BD880212BCDEE9D34929164D5CB08032594E5E1D25C0055E5B771E966783240220CD19E802E200F4588450BC401A8FB14E0A1805B36F3243B2833247536B70BDC00A60348880C7730039400B402A91009F650028C00E2020918077610021C00C1002D80512601188803B4000C148025010036727EE5AD6B445CC011E00B825E14F4BBF5F97853D2EFD6256F8FFE9F3B001420C01A88915E259002191EE2F4392004323E44A8B4C0069CEF34D304C001AB94379D149BD904507004A6D466B618402477802E200D47383719C0010F8A507A294CC9C90024A967C9995EE2933BA840
//"""
//
//struct Operation {
//   var version: Int
//   var type: Int
//   var lengthTypeId: Int?
//   var value: Int?
//   var suboperations: [Operation] = []
//
//   func versionValue() -> Int {
//      return version + suboperations.reduce(into: 0, { (res, op) in
//         res = res + op.versionValue()
//      })
//   }
//
//   func evaluate() -> Int {
//      switch type {
//      case 0:
//         // Add
//         return suboperations.reduce(into: 0) { (res, op) in
//            res = res + op.evaluate()
//         }
//      case 1:
//         // product
//         return suboperations.reduce(into: 1) { (res, op) in
//            res = res * op.evaluate()
//         }
//      case 2:
//         // min
//         return suboperations.map({$0.evaluate()}).sorted().first!
//      case 3:
//         // max
//         return suboperations.map({$0.evaluate()}).sorted(by: >).first!
//      case 4:
//         // Values!
//         return value!
//      case 5:
//         // >
//         guard suboperations.count == 2,
//               let subop1 = suboperations.first,
//               let subop2 = suboperations.last else {
//            assertionFailure("MORE THAN TWO OPS. BAD BAD")
//            return -Int.max
//         }
//         return subop1.evaluate() > subop2.evaluate() ? 1 : 0
//
//      case 6:
//         // <
//         guard suboperations.count == 2,
//               let subop1 = suboperations.first,
//               let subop2 = suboperations.last else {
//            assertionFailure("MORE THAN TWO OPS. BAD BAD")
//            return -Int.max
//         }
//
//         return subop1.evaluate() < subop2.evaluate() ? 1 : 0
//      case 7:
//         // ==
//         guard suboperations.count == 2,
//               let subop1 = suboperations.first,
//               let subop2 = suboperations.last else {
//            assertionFailure("MORE THAN TWO OPS. BAD BAD")
//            return -Int.max
//         }
//
//         return subop1.evaluate() == subop2.evaluate() ? 1 : 0
//      default:
//         assertionFailure("UH WAT")
//         return -Int.max
//      }
//   }
//}
//
//let inputLines:[String] = input.split(separator: "\n").map({String($0)})
//
//let bin:String = inputLines.first!.hexaToBinary
//
//var idx = 0
//var ops: [Operation] = []
//var versionSum: Int = 0
//
//func readOperation(packetLength: Int?, packetCount: Int?) -> Operation {
//   // Get version
//   let versionBits = String(bin[idx..<idx+3])
//   let version = Int(versionBits, radix: 2)!
//   idx = idx+3
//
//   // Get type
//   let typeBits = String(bin[idx..<idx+3])
//   let type = Int(typeBits, radix: 2)!
//   idx = idx+3
//
//   var op = Operation(version: version,
//                      type: type)
//
//   if type != 4 {
//      // Do operator things
//      // NExt bit is "I"
//      let lengthTypeId = String(bin[idx])
//      idx = idx + 1
//
//      if lengthTypeId == "0" {
//         /// If the length type ID is 0, then the next 15 bits are a number that represents the total length in bits of the sub-packets contained by this packet.
//         // read next 15 bits. Will tell us the number of subpackets in this chain
//         let subPacketsBits = String(bin[idx..<idx+15])
//         let subPacketsLength = Int(subPacketsBits, radix: 2)!
//         idx = idx + 15
//         let startingIndex = idx
//         while subPacketsLength > idx - startingIndex {
//            op.suboperations.append(readOperation(packetLength: subPacketsLength, packetCount: packetCount))
//         }
//         // Assuming Subpackets are just back to back
//      } else {
//         /// If the length type ID is 1, then the next 11 bits are a number that represents the number of sub-packets immediately contained by this packet.
//         // read next 11 bits. will tell us how many times we repeat readings for "Subpackets"
//         let subPacketsBits = String(bin[idx..<idx+11])
//         let subPacketCount = Int(subPacketsBits, radix: 2)!
//         idx = idx + 11
//         for _ in 0..<subPacketCount {
//            op.suboperations.append(readOperation(packetLength: packetLength, packetCount: subPacketCount))
//         }
//      }
//   } else {
//      // Get literal. 5 bits each, first bit is whether its last # or not
//      // TODO: Don't save the 'first' bit to the final number. Append all literal bits (after identifier) then get a final number.
//      // ALso need to consider "empty" bits at the end. idx%4 should tell us if we have empty bits
//      var literalsBits: String = ""
//      var onLastLiteral = false
//      repeat {
//         let msgBit = String(bin[idx])
//         idx = idx+1
//         literalsBits += String(bin[idx..<idx+4])
//         idx = idx + 4
//         if msgBit == "0" {
//            onLastLiteral = true
//         }
//      } while !onLastLiteral
//
//      op.value = Int(literalsBits, radix: 2)
//
//      // What do we do with literals lmao?
//      // NOthing yet idk
//   }
//   return op
//}
//
//func roundOutIdxIfNeeded() {
//   // All hex is 4-based, so if our index is off we need to adjust
//   // Sanity check the next X bits are 0's
//   guard idx%4 > 0 else {
//      return
//   }
//   if String(bin[idx..<idx + idx%4]).contains("1") {
//      assertionFailure("We're fast-forwarding past probably real data. Whoops")
//   }
//   idx = idx + (idx%4)
//}
//
//while idx < bin.count - 6 {
//   ops.append(readOperation(packetLength: nil, packetCount: nil))
////   roundOutIdxIfNeeded()
//}
//
//print(ops.count)
//
//// fulfill operations
//print(ops.first!.evaluate())
//
//
//for op in ops {
//   versionSum = versionSum + op.versionValue()
//}
//print(versionSum)
//
//extension String {
//   func getNumsWithoutDelimiters() -> [Int] {
//      return self.compactMap({$0.wholeNumberValue})
//   }
//
//   subscript(_ offset: Int)                     -> Element     { self[index(startIndex, offsetBy: offset)] }
//   subscript(_ range: Range<Int>)               -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
//   subscript(_ range: ClosedRange<Int>)         -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
//   subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
//   subscript(_ range: PartialRangeUpTo<Int>)    -> SubSequence { prefix(range.upperBound) }
//   subscript(_ range: PartialRangeFrom<Int>)    -> SubSequence { suffix(Swift.max(0, count-range.lowerBound)) }
//
//   typealias Byte = UInt8
//   var hexaToBytes: [Byte] {
//      var start = startIndex
//      return stride(from: 0, to: count, by: 2).compactMap { _ in   // use flatMap for older Swift versions
//         let end = index(after: start)
//         defer { start = index(after: end) }
//         return Byte(self[start...end], radix: 16)
//      }
//   }
//   var hexaToBinary: String {
//      return hexaToBytes.map {
//         let binary = String($0, radix: 2)
//         return repeatElement("0", count: 8-binary.count) + binary
//      }.joined()
//   }
//}
//
//extension Array where Element:Hashable {
//   func dedupe() -> Array {
//      return Array(Set(self))
//   }
//}
//
//extension Collection {
//    /// Returns the element at the specified index if it is within bounds, otherwise nil.
//    subscript (safe index: Index) -> Element? {
//        return indices.contains(index) ? self[index] : nil
//    }
//}
//
