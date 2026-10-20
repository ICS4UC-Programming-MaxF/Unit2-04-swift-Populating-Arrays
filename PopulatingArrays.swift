/*
 * Created by: MF-ROB
 * Created on: Oct 2026
 * Generates an array of 10 random integers (0 to 100),
 * displays them on one line, then sorts the array with
 * Arrays.sort(), calculates the average, and displays the
 * sorted array and average. This process is repeated 5 times.
 */

import Foundation

let inputFile = "input.txt"
let outputFile = "output.txt"


func appendLine(_ text: String, to path: String) {
    let data = (text + "\n").data(using: .utf8)!
    if let handle = FileHandle(forWritingAtPath: path) {
        handle.seekToEndOfFile()
        handle.write(data)
        handle.closeFile()
    } else {
        FileManager.default.createFile(atPath: path, contents: data)
    }
}


func populateArray() -> [Int] {
    var numbers = [Int](repeating: 0, count: 10)

    for i in 0..<numbers.count {
        numbers[i] = Int.random(in: 0...100)
    }
    let text = numbers.map { String($0) }.joined(separator: " ")
    print(text)
    appendLine(text, to: inputFile)
    return numbers
}


func calculateAverage(_ numbers: [Int]) {
    let sorted = numbers.sorted()   // Swift's equivalent of Arrays.sort()

    var sum = 0
    for n in sorted {
        sum += n
    }
    let average = Double(sum) / Double(sorted.count)

    let line = sorted.map { String($0) }.joined(separator: " ")
    let text = "\(line)  Average:  \(String(format: "%.1f", average))"
    print(text)
    appendLine(text, to: outputFile)
}

// Main: clear the files, then call each function 5 times
try? "".write(toFile: inputFile, atomically: true, encoding: .utf8)
try? "".write(toFile: outputFile, atomically: true, encoding: .utf8)

for _ in 1...5 {
    let numbers = populateArray()
    calculateAverage(numbers)
}