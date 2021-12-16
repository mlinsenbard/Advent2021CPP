////
////  main.swift
////  AoC
////
////  Created by Max Linsenbard on 12/8/21.
////
//
//import Foundation
//
//struct Point: Equatable, Hashable {
//   let x: Int
//   let y: Int
//
//   func isValid(maxX: Int, maxY: Int) -> Bool {
//      return x < maxX && y < maxY && x >= 0 && y >= 0
//   }
//}
//
//struct JellyMap {
//   var map: [Int]
//   let maxX: Int
//   let maxY: Int
//
//   var flashCount = 0
//
//   func neighbors(for point: Point) -> [Point] {
//      var points: [Point] = []
//      // Add all possible options, then remove ones that aren't valid
//
//      for x in stride(from: -1, through: 1, by: 1) {
//         for y in stride(from: -1, through: 1, by: 1) {
//             points.append(Point(x: x+point.x, y: y+point.y))
//         }
//      }
//
//      points.removeAll(where: {!$0.isValid(maxX: maxY, maxY: maxY) || $0 == point})
//      return points
//   }
//
//   func value(for point: Point) -> Int {
//      return map[point.x + point.y * maxY]
//   }
//
//   mutating func explode(point: Point) {
//      // Explode increments anything other than 9s,
//      guard value(for: point) != 0 else { return }
//
//      if value(for: point) > 9 {
//         flashCount = flashCount + 1
//         map[point.x + point.y * maxY] = 0
//
//         for n in neighbors(for: point) {
//            explode(point: n)
//         }
//      } else if value(for: point) != 0 {
//         map[point.x + point.y * maxY] = value(for: point) + 1
//         if value(for: point) > 9 {
//            explode(point: point)
//         }
//      }
//   }
//
//   mutating func incrementAll() {
//      for y in 0..<maxY {
//         for x in 0..<maxX {
//            map[x + y * maxY] = map[x + y * maxY] + 1
//         }
//      }
//   }
//
//   mutating func explodeAll() {
//      for y in 0..<maxY {
//         for x in 0..<maxX {
//            let p = Point(x: x, y: y)
//            if (value(for: p) > 9) {
//               explode(point: Point(x: x, y: y))
//            }
//         }
//      }
//   }
//
//   func printMap() {
//      for y in 0..<maxY {
//         for x in 0..<maxX {
//            let p = Point(x: x, y: y)
//            print(value(for: p), separator: "", terminator: "")
//         }
//         print("")
//      }
//      print("\n")
//   }
//}
//
//let sampleInput = """
//5483143223
//2745854711
//5264556173
//6141336146
//6357385478
//4167524645
//2176841721
//6882881134
//4846848554
//5283751526
//"""
//
//let input = """
//7232374314
//8531113786
//3411787828
//5482241344
//5856827742
//7614532764
//5311321758
//1255116187
//5821277714
//2623834788
//
//"""
//
//let inputLines = input.split(separator: "\n").map({String($0)})
//
//let maxX = inputLines[0].count
//let maxY = inputLines.count
//var jellyMap = JellyMap(map: [], maxX: maxX, maxY: maxY)
//
//for i in 0..<inputLines.count {
//   let line:String = inputLines[i]
//   jellyMap.map.append(contentsOf: line.getNumsWithoutDelimiters())
//}
//
//var i = 0
//var bigBoom = false
//repeat {
//   let currentFlashCount = jellyMap.flashCount
//   jellyMap.incrementAll()
//   jellyMap.explodeAll()
//   let newFlashCount = jellyMap.flashCount
//
//   if newFlashCount - currentFlashCount >= 100 {
//      bigBoom = true
//      break
//   }
//
//   i = i+1
//
//   jellyMap.printMap()
//} while !bigBoom
//
//print("Big Boom on: \(i+1)")
//print("Jelly Flashes: \(jellyMap.flashCount)")
//
//extension String {
//   func getNumsWithoutDelimiters() -> [Int] {
//      return self.compactMap({$0.wholeNumberValue})
//   }
//}
//
