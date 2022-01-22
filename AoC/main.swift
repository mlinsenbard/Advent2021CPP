//
//  main.swift
//  AoC
//
//  Created by Max Linsenbard on 12/8/21.
//

import Foundation
import GameplayKit

let ez_18 = """
[[[[4,3],4],4],[7,[[8,4],9]]]
[1,1]
"""

let si_18 = """
[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
[7,[5,[[3,8],[1,4]]]]
[[2,[2,2]],[8,[8,1]]]
[2,9]
[1,[[[9,3],9],[[9,0],[0,7]]]]
[[[5,[7,4]],7],1]
[[[[4,2],2],6],[8,7]]
"""

let i_18 = """
[[7,[8,[3,5]]],[[[3,6],9],1]]
[[[[1,7],8],[0,4]],[[[0,9],2],[2,[5,6]]]]
[[[4,[4,4]],[8,[4,4]]],[[5,4],6]]
[[[1,[1,3]],[[9,6],1]],[[4,[5,4]],[[4,4],[0,8]]]]
[[[[6,2],[2,5]],[2,1]],[[1,5],7]]
[[[[5,0],[2,7]],[[2,5],2]],[2,[3,2]]]
[[[6,[6,6]],[0,[2,8]]],[[8,[5,6]],[4,5]]]
[[[6,[3,5]],8],[[2,[7,0]],5]]
[[[[7,8],[3,6]],[1,6]],[[[4,2],1],[[0,7],[5,6]]]]
[8,2]
[[5,5],[[2,[9,1]],8]]
[[[4,8],[[1,8],2]],[9,2]]
[2,[[8,[8,3]],[0,6]]]
[[[6,6],[[6,0],6]],[0,[[3,4],3]]]
[[[[2,9],[5,9]],[2,[4,3]]],[6,0]]
[[[6,2],0],[7,7]]
[[[9,6],5],[2,[[0,1],[5,5]]]]
[[6,[[0,1],[5,1]]],5]
[4,[[[4,2],3],[2,[5,0]]]]
[[[7,9],2],2]
[[[5,[2,1]],1],[[1,1],[8,5]]]
[[[[5,9],0],[[1,9],0]],4]
[[7,[0,5]],[[0,3],[8,2]]]
[[6,[9,[7,7]]],6]
[2,[[1,[1,0]],[4,[6,1]]]]
[[0,6],[[[5,1],6],[[4,7],[8,0]]]]
[[[1,[4,7]],[0,[1,2]]],[[1,1],[[1,2],[1,3]]]]
[[8,[3,0]],[3,[1,[8,1]]]]
[[[7,[4,0]],[[8,7],2]],[[7,[7,3]],7]]
[3,[[1,7],2]]
[8,[[[1,5],0],1]]
[[6,[1,4]],7]
[[[[2,6],2],8],1]
[9,7]
[9,[[[1,1],1],[[3,0],[7,3]]]]
[[[[8,5],7],[[5,1],[6,4]]],[4,[[7,6],[2,7]]]]
[[[[8,7],1],0],[[9,9],[[1,0],8]]]
[[9,[[1,1],7]],[[3,0],4]]
[[[[8,2],4],[9,[7,9]]],[[0,2],[[3,0],5]]]
[[[[3,6],3],[[9,7],[0,6]]],[[[4,9],[1,3]],[2,[7,3]]]]
[[[[3,8],0],[[3,6],5]],[[3,[4,2]],[[6,1],[8,5]]]]
[[2,7],[[0,0],8]]
[[[[0,3],7],[2,0]],3]
[[0,2],[[[3,1],0],[0,0]]]
[[[[6,1],7],[[8,4],[2,4]]],[[1,6],[2,3]]]
[[2,[2,[9,1]]],[4,[[0,4],9]]]
[[[3,[5,6]],7],1]
[[[3,0],[8,[9,3]]],[[[1,1],1],[6,7]]]
[[[6,[4,4]],[[1,9],1]],[[[8,1],[9,8]],[[6,3],1]]]
[[[5,8],[[0,3],[1,7]]],[[[3,2],[4,7]],1]]
[[5,5],[[[8,3],[6,6]],2]]
[[[[1,9],[8,5]],[[7,7],8]],[0,[8,[7,4]]]]
[[6,[4,[4,3]]],[5,[6,[7,2]]]]
[[0,[[9,0],0]],5]
[[[[5,6],[1,3]],[[0,5],[7,5]]],[[[0,4],[3,6]],[8,[3,6]]]]
[[3,[[4,7],[7,0]]],[[[4,1],5],[[6,6],[7,4]]]]
[[[[4,3],[0,1]],[[7,3],[2,3]]],[[[3,7],[2,2]],[6,5]]]
[[1,1],[[[1,4],6],[6,[3,9]]]]
[[[[0,8],[2,0]],5],[4,[[6,1],[2,1]]]]
[[7,[3,[7,2]]],[[7,9],8]]
[[[4,[9,8]],[8,[3,2]]],[7,9]]
[[[4,[4,2]],[5,[0,3]]],[[[4,9],[2,9]],[[1,5],[0,8]]]]
[[1,[[9,8],0]],[5,[[4,3],5]]]
[[[[5,1],3],[[2,9],[9,0]]],[1,[6,3]]]
[[[6,4],[6,1]],7]
[[4,8],[[7,2],6]]
[[[5,[4,8]],[[1,7],[2,8]]],[6,[[8,4],[3,5]]]]
[[5,8],[[[4,0],[6,0]],[5,[6,0]]]]
[[3,[[5,3],8]],[8,5]]
[[[2,6],[1,[2,3]]],[[[1,7],[5,7]],[[0,0],[0,5]]]]
[[0,[[4,3],[3,6]]],[[2,[6,6]],[0,[2,9]]]]
[[[5,9],[6,2]],[[7,6],8]]
[[9,2],[1,[[0,5],[5,0]]]]
[[[3,1],[9,3]],3]
[[[[2,0],[4,2]],6],[[[5,2],[7,8]],[[0,7],3]]]
[[7,[[3,9],[6,3]]],[2,[[6,4],3]]]
[[5,[3,[7,4]]],[[2,5],[0,9]]]
[3,7]
[[3,9],[[[4,4],9],[[3,1],7]]]
[[[[4,0],1],[8,[3,6]]],[[9,[4,4]],[[9,9],9]]]
[[8,[[8,1],5]],[[[9,1],4],[[8,5],3]]]
[[6,[[6,3],[3,7]]],4]
[[[1,[0,8]],9],[[8,5],[3,[0,5]]]]
[[[[3,1],0],[[8,5],[1,0]]],[0,2]]
[[2,[4,7]],2]
[[[2,0],[2,2]],4]
[4,[[5,8],5]]
[[[2,[0,5]],[[3,3],[6,6]]],1]
[[[2,[2,4]],[5,[7,1]]],[3,5]]
[[2,[9,[3,9]]],9]
[[[7,[7,1]],[[5,2],1]],[[2,1],[9,[7,3]]]]
[[4,[4,6]],4]
[[[4,2],[9,[3,8]]],[[2,4],0]]
[[[7,[0,3]],4],[[[1,8],4],[[5,1],1]]]
[[[1,3],3],[[4,9],[[0,0],6]]]
[[[4,1],0],[[[5,6],[0,8]],[[2,1],1]]]
[[3,[3,[7,9]]],[[[6,8],8],[[7,9],3]]]
[[4,[[1,6],[4,6]]],[[1,8],[3,8]]]
[[[[5,9],2],[[6,7],4]],3]
[[[[2,1],[1,9]],7],[[[0,9],[0,5]],[[2,5],[5,0]]]]
"""

class SnailNumber {
   var left: SnailNumber?
   var right: SnailNumber?
   var leftValue: Int?
   var rightValue: Int?

   var parent: SnailNumber?

   init() {}
}

func getIntFromStringStarting(at index: Int, from: String) -> Int? {
   //This is terrible
   var chars: [String.Element] = []
   chars.append(from[index])
   if index+1 < from.count {
      chars.append(from[index+1])
   }

   chars.removeAll(where: {!$0.isNumber})
   return Int(String(chars))
}

func add(line: String, toLine: String) -> String {
   return "[\(toLine),\(line)]"
}

func reduce(line: String) -> String {
   var braceStack: [String] = []
   var mutableLine = line
   var i = 0

   while i < mutableLine.count {
      // Check for explosions
      if mutableLine[i] == "[" {
         if braceStack.count >= 4 {
            // Check if pair, then explode
            // since we're going char-by-char, need to check if i+1 is an int, i+2 is a comma, and i+3 is an int
            var pairFinder = i
            var isPair = true

            while mutableLine[pairFinder] != "]" {
               if mutableLine[pairFinder] == "]" {
                  // not a pair break
                  isPair = false
                  break
               }
               pairFinder = pairFinder + 1
            }
            if isPair {
               // EXPLODE TIME. Find next leftmost # and add leftPairNum
               let pair = String(mutableLine[i...pairFinder])
               // i hate my life
               let leftPairNum = Int(String(pair.split(separator: ",")[0].filter({$0.isNumber})))!
               let rightPairNum = Int(String(pair.split(separator: ",")[1].filter({$0.isNumber})))!

               var leftExplodeIterator = i-1
               while leftExplodeIterator > 0 {
                  if let leftNumToReplace = Int(String(mutableLine[leftExplodeIterator])) {
                     let newNum = leftNumToReplace + leftPairNum
                     if newNum > 9 {
                        i = i+1
                     }
                     mutableLine.remove(at: mutableLine.index(at: leftExplodeIterator))
                     mutableLine.insert(contentsOf: "\(newNum)", at: mutableLine.index(at: leftExplodeIterator))
                     break
                  }
                  leftExplodeIterator = leftExplodeIterator - 1
               }

               // EXPLODE Right
               var rightExplodeIterator = i+pair.firstIndex(of: ",")!.utf16Offset(in: pair)
               while rightExplodeIterator < mutableLine.count {
                  if let rightNumToReplace = Int(String(mutableLine[rightExplodeIterator])) {
                     let newNum = rightNumToReplace + rightPairNum
                     mutableLine.remove(at: mutableLine.index(at: rightExplodeIterator))
                     mutableLine.insert(contentsOf: "\(newNum)", at: mutableLine.index(at: rightExplodeIterator))
                     break
                  }
                  rightExplodeIterator = rightExplodeIterator + 1
               }

               // I guess replace the whole ass pair with 0 now
               // Remove [xx,xx] - 5-7 chars
               for _ in 0...4 {
                  mutableLine.remove(at: mutableLine.index(at: i))
               }

               mutableLine.insert(contentsOf: "\(0)", at: mutableLine.index(at: i))

               i = 0
               braceStack = []
               continue
            }
         }
         braceStack.append("[")
      } else if mutableLine[i] == "]" {
         if !braceStack.isEmpty {
         braceStack.removeLast()
         }
      }

      // Check for split... doing so all ghetto like by checking if next character after a number
      if i != mutableLine.count-1,
         let splitNum = Int((String(mutableLine[i]) + String(mutableLine[i+1])).trimmingCharacters(in: .punctuationCharacters)),
         splitNum >= 10
      {
         // replace number with pair
         let left: Int = Int(floor(Double(splitNum)/2.0))
         let right: Int = Int(ceil(Double(splitNum)/2.0))
         let splitPairString = "[\(left),\(right)]"

         // 2 characters, so call twice
         mutableLine.remove(at: mutableLine.index(at: i))
         mutableLine.remove(at: mutableLine.index(at: i))

         // Add in splitPairString
         mutableLine.insert(contentsOf: splitPairString, at: mutableLine.index(at: i))

         // Reset all our shit after doing an op
         i = 0
         braceStack = []
         continue
      }

      i = i+1
   }

   return mutableLine
}

let inputLines:[String] = si_18.split(separator: "\n").map({String($0)})

var mutableLines = inputLines
var snailLine = mutableLines.removeFirst()

while !mutableLines.isEmpty {
   snailLine = add(line: mutableLines.removeFirst(), toLine: snailLine)
   snailLine = reduce(line: snailLine)
   print(snailLine)
}

print(snailLine)
