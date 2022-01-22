//
//  HELP.swift
//  AoC
//
//  Created by Max Linsenbard on 12/19/21.
//

import Foundation

extension Int {
   func summation() -> Int {
      return (self * (self + 1))/2
   }
}

extension String {
   func index(at: Int) -> String.Index { self.index(self.startIndex, offsetBy: at) }

   func getNumsWithoutDelimiters() -> [Int] {
      return self.compactMap({$0.wholeNumberValue})
   }

   subscript(_ offset: Int)                     -> Element     { self[index(startIndex, offsetBy: offset)] }
   subscript(_ range: Range<Int>)               -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
   subscript(_ range: ClosedRange<Int>)         -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
   subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
   subscript(_ range: PartialRangeUpTo<Int>)    -> SubSequence { prefix(range.upperBound) }
   subscript(_ range: PartialRangeFrom<Int>)    -> SubSequence { suffix(Swift.max(0, count-range.lowerBound)) }

   typealias Byte = UInt8
   var hexaToBytes: [Byte] {
      var start = startIndex
      return stride(from: 0, to: count, by: 2).compactMap { _ in   // use flatMap for older Swift versions
         let end = index(after: start)
         defer { start = index(after: end) }
         return Byte(self[start...end], radix: 16)
      }
   }
   var hexaToBinary: String {
      return hexaToBytes.map {
         let binary = String($0, radix: 2)
         return repeatElement("0", count: 8-binary.count) + binary
      }.joined()
   }
}

extension Array where Element:Hashable {
   func dedupe() -> Array {
      return Array(Set(self))
   }
}

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
