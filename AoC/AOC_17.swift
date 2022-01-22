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
//x=20..30, y=-10..-5
//"""
//
//let input = """
//x=240..292, y=-90..-57
//"""
//
//let inputLines:[String] = input.split(separator: "\n").map({String($0)})
//
//let usingSample = false
//
//let areaXMin = usingSample ? 20 : 240
//let areaXMax = usingSample ? 30 : 292
//let areaYMin = usingSample ? -10 : -90
//let areaYMax = usingSample ? -5 : -57
//
//// for xvel where (x * (x+1)) / 2 is >= XMIN || <= XMAX
//// find Y's that fit
//let validXs = (0...100).filter({
//   let summation = ($0 * ($0 + 1))/2
//   return summation >= areaXMin && summation <= areaXMax
//})
//
//let biggestY = (0...100).filter({
//   let maxHeight = ($0 * ($0 + 1))/2
//   var currHeight = maxHeight
//   var decrementer = 1
//   while currHeight >= areaYMin {
//      currHeight = currHeight - decrementer
//      if currHeight <= areaYMax && currHeight >= areaYMin {
//         return true
//      }
//      decrementer = decrementer+1
//   }
//   return false
//}).max()!
//
//print(validXs)
//print(biggestY)
//print("max height = \((biggestY * (biggestY + 1))/2)")
//
//func simulate(x: Int, y: Int) -> Int {
//   var xAccel = x
//   var yAccel = y
//   var curPosX = 0
//   var curPosY = 0
//   while curPosX <= areaXMax && curPosY >= areaYMin {
//      curPosX = curPosX + xAccel
//      curPosY = curPosY + yAccel
//      if areaXMin...areaXMax ~= curPosX && areaYMin...areaYMax ~= curPosY {
//         return 1
//      }
//      xAccel = max(xAccel - 1, 0)
//      yAccel = yAccel - 1
//   }
//
//   return 0
//}
//
//var validPointCount = 0
//
//for y in areaYMin...100 {
//   for x in 0...areaXMax {
//      validPointCount = validPointCount + simulate(x: x, y: y)
//   }
//}
//
//print("VALID POINTS: \(validPointCount)")
//
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
