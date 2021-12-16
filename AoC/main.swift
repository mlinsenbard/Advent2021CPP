//
//  main.swift
//  AoC
//
//  Created by Max Linsenbard on 12/8/21.
//

import Foundation
import GameplayKit

let sampleInput = """
"""

let input = """
"""

let inputLines:[String] = input.split(separator: "\n").map({String($0)})

extension String {
   func getNumsWithoutDelimiters() -> [Int] {
      return self.compactMap({$0.wholeNumberValue})
   }

   subscript(_ offset: Int)                     -> Element     { self[index(startIndex, offsetBy: offset)] }
   subscript(_ range: Range<Int>)               -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
   subscript(_ range: ClosedRange<Int>)         -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
   subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
   subscript(_ range: PartialRangeUpTo<Int>)    -> SubSequence { prefix(range.upperBound) }
   subscript(_ range: PartialRangeFrom<Int>)    -> SubSequence { suffix(Swift.max(0, count-range.lowerBound)) }
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
