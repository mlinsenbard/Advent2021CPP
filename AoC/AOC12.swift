////
////  main.swift
////  AoC
////
////  Created by Max Linsenbard on 12/8/21.
////
//
//import Foundation
//
//let smolSample = """
//start-A
//start-b
//A-c
//A-b
//b-d
//A-end
//b-end
//"""
//
//let sampleInput = """
//fs-end
//he-DX
//fs-he
//start-DX
//pj-DX
//end-zg
//zg-sl
//zg-pj
//pj-he
//RW-he
//fs-DX
//pj-RW
//zg-RW
//start-pj
//he-WI
//zg-he
//pj-fs
//start-RW
//"""
//
//let input = """
//FK-gc
//gc-start
//gc-dw
//sp-FN
//dw-end
//FK-start
//dw-gn
//AN-gn
//yh-gn
//yh-start
//sp-AN
//ik-dw
//FK-dw
//end-sp
//yh-FK
//gc-gn
//AN-end
//dw-AN
//gn-sp
//gn-FK
//sp-FK
//yh-gc
//"""
//
//struct Node: Hashable {
//   let name: String
//   var connections: Set<String>
//
//   func isSmall() -> Bool {
//      return name.first!.isLowercase && name != "start" && name != "end"
//   }
//
//   static func == (lhs: Node, rhs: Node) -> Bool {
//      return lhs.name == rhs.name
//   }
//}
//
//let inputLines = input.split(separator: "\n").map({String($0)})
//var graph: [Node] = []
//
//for line in inputLines {
//   let source = String(line.split(separator: "-")[0])
//   let destination = String(line.split(separator: "-")[1])
//
//   if let i = graph.firstIndex(where: {$0.name == source}) {
//      graph[i].connections.insert(destination)
//   } else {
//      graph.append(Node(name: source, connections: [destination]))
//   }
//
//   if let i = graph.firstIndex(where: {$0.name == destination}) {
//      graph[i].connections.insert(source)
//   } else {
//      graph.append(Node(name: destination, connections: [source]))
//   }
//}
//
//print(graph)
//
//var validPathCount = 0
//var paths: [[String]] = []
//
//let startNode = graph.first(where: {$0.name == "start"})!
//
//// Find all possible paths from Start->end using depth-first
//// Path append rules:
//// idk man this is hard
//// For now, just don't append if the smol cave already exists
//// Dedupe possible paths after all is said and done
//
//var startConnetions = startNode.connections
//
//func alreadyHasDupe(path: [String]) -> Bool {
//   for c in path {
//      if c.first!.isLowercase {
//         if path.filter({$0 == c}).count >= 2 {
//            return true
//         }
//      }
//   }
//
//   return false
//}
//
//func isEligibleCave(cave: String, path: [String]) -> Bool {
//   // Can't try to add again if it's already duped
//   if path.filter({$0 == cave}).count >= 2 {
//      return false
//   }
//
//   // Shouldnt add if we're gonna make dupe 2 electric boogaloo
//   if alreadyHasDupe(path: path) && path.contains(cave) {
//      return false
//   }
//
//   // Can't add it in if we're going to create another dupe
//   return true
//}
//
//func dupeTinyCave(path: [String]) -> String? {
//   var dupes: [String] = []
//
//   for p in path {
//      if dupes.contains(p) {
//         return p
//      }
//
//      else if p.first!.isLowercase {
//         dupes.append(p)
//      }
//   }
//
//   return nil
//}
//
//func allSubPathsFrom(nodeName: String, currentPath: [String]) -> [[String]] {
//   var subpaths: [[String]] = []
//
//   if nodeName == "end" {
//      // Dont go "back" from end, just return it
//      return [["end"]]
//   }
//
//   if nodeName == "start" {
//      // return nothing
//      return []
//   }
//
//   if nodeName.first!.isLowercase {
//      if !isEligibleCave(cave: nodeName, path: currentPath) {
//         // Also do nothing, we've already visited this small cave (twice)
//         return []
//      }
//   }
//
//   var newCurrentPath = currentPath
//   newCurrentPath.insert(nodeName, at: 0)
//
//   for subnode in graph.first(where: {$0.name == nodeName})!.connections {
//      subpaths.append(contentsOf: allSubPathsFrom(nodeName: subnode, currentPath: newCurrentPath))
//   }
//
//   for i in 0..<subpaths.count {
//      subpaths[i].insert(nodeName, at: 0)
//   }
//
//   return subpaths
//}
//
//func hasADupe(arr: [String]) -> Bool {
//   let a = arr.filter({$0.first!.isLowercase})
//   let s = Array(Set(a))
//
//   return (a != s)
//}
//
//while !startConnetions.isEmpty {
//   let currentConnection = startConnetions.removeFirst()
//   paths.append(contentsOf: allSubPathsFrom(nodeName: currentConnection, currentPath: []))
//}
//
//for p in paths {
//   print(p.reduce(into: "", { (res, s) in
//      res = res+s+","
//   }))
//}
//
//print("valid paths: \(paths.count)")
//
//
//extension String {
//   func getNumsWithoutDelimiters() -> [Int] {
//      return self.compactMap({$0.wholeNumberValue})
//   }
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
