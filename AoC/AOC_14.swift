////
////  main.swift
////  AoC
////
////  Created by Max Linsenbard on 12/8/21.
////
//
//import Foundation
//
//let sampleInput = """
//NNCB
//
//CH -> B
//HH -> N
//CB -> H
//NH -> C
//HB -> C
//HC -> B
//HN -> C
//NN -> C
//BH -> H
//NC -> B
//NB -> B
//BN -> B
//BB -> N
//BC -> B
//CC -> N
//CN -> C
//"""
//
//let input = """
//CKFFSCFSCBCKBPBCSPKP
//
//NS -> P
//KV -> B
//FV -> S
//BB -> V
//CF -> O
//CK -> N
//BC -> B
//PV -> N
//KO -> C
//CO -> O
//HP -> P
//HO -> P
//OV -> O
//VO -> C
//SP -> P
//BV -> H
//CB -> F
//SF -> H
//ON -> O
//KK -> V
//HC -> N
//FH -> P
//OO -> P
//VC -> F
//VP -> N
//FO -> F
//CP -> C
//SV -> S
//PF -> O
//OF -> H
//BN -> V
//SC -> V
//SB -> O
//NC -> P
//CN -> K
//BP -> O
//PC -> H
//PS -> C
//NB -> K
//VB -> P
//HS -> V
//BO -> K
//NV -> B
//PK -> K
//SN -> H
//OB -> C
//BK -> S
//KH -> P
//BS -> S
//HV -> O
//FN -> F
//FS -> N
//FP -> F
//PO -> B
//NP -> O
//FF -> H
//PN -> K
//HF -> H
//VK -> K
//NF -> K
//PP -> H
//PH -> B
//SK -> P
//HN -> B
//VS -> V
//VN -> N
//KB -> O
//KC -> O
//KP -> C
//OS -> O
//SO -> O
//VH -> C
//OK -> B
//HH -> B
//OC -> P
//CV -> N
//SH -> O
//HK -> N
//NO -> F
//VF -> S
//NN -> O
//FK -> V
//HB -> O
//SS -> O
//FB -> B
//KS -> O
//CC -> S
//KF -> V
//VV -> S
//OP -> H
//KN -> F
//CS -> H
//CH -> P
//BF -> F
//NH -> O
//NK -> C
//OH -> C
//BH -> O
//FC -> V
//PB -> B
//"""
//
//let inputLines = input.split(separator: "\n").map({String($0)})
//
//struct Template {
//   /// Mapping of template string to it's index in the template
//   var templatePairCounts: [String:Int64]
//   /// Mapping of template string to it's count in the template
//   var templateStringCounts: [String:Int64]
//
//   var elementCount: Int64 = 0
//
//   mutating func append(pair: String) {
//      if let count = templatePairCounts[pair] {
//         templatePairCounts[pair] = count + 1
//      } else {
//         templatePairCounts[pair] = 1
//      }
//
//      // Update count
//      let char1 = String(pair[0])
//      let char2 = String(pair[1])
//
//      templateStringCounts[char1] = Int64((templateStringCounts[char1] ?? 0) + 1)
//      templateStringCounts[char2] = Int64((templateStringCounts[char2] ?? 0) + 1)
//   }
//}
//
//var template: Template = Template(templatePairCounts: [:], templateStringCounts: [:])
//var pairMap: [String:String] = [:]
//
//for line in inputLines {
//   if line.contains(" -> ") {
//      let pair = String(line.replacingOccurrences(of: " ->", with: "").split(separator: " ")[0])
//      let mapping = String(line.replacingOccurrences(of: " ->", with: "").split(separator: " ")[1])
//      pairMap[pair] = mapping
//   } else {
//      for i in stride(from: 0, to: line.count-1, by: 1) {
//         template.append(pair: String(line[i])+String(line[i+1]))
//      }
//   }
//}
//
//for x in 0..<40 {
//   var newTemplate: Template = Template(templatePairCounts: [:], templateStringCounts: [:])
//
//   for (pair,count) in template.templatePairCounts {
//      if let insertChar = pairMap[pair] {
//         let newPair1 = String(pair[0])+insertChar
//         let newPair2 = insertChar+String(pair[1])
//         newTemplate.templatePairCounts[newPair1] = (newTemplate.templatePairCounts[newPair1] ?? 0)+count
//         newTemplate.templatePairCounts[newPair2] = (newTemplate.templatePairCounts[newPair2] ?? 0)+count
//      } else {
//         newTemplate.templatePairCounts[pair] = count
//      }
//   }
//
//   template = newTemplate
//}
//
//print(template)
//
//var counts: [String:Int64]=[:]
//
//for (p,v) in template.templatePairCounts {
//   counts[String(p[0])] = (counts[String(p[0])] ?? 0) + v
//   counts[String(p[1])] = (counts[String(p[1])] ?? 0) + v
//}
//
//print(counts.sorted(by:{$0.1>$1.1}))
//
////F 967990154508     | 483995077254
////P 9189126468813   |  4594563234407
//
//print (4594563234407 - 483995077254)
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
//}
//
//extension Array where Element:Hashable {
//   func dedupe() -> Array {
//      return Array(Set(self))
//   }
//}
//
//
//
