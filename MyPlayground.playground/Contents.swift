import Cocoa

var str = "Hello, playground"


public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    var smallest  =  1
    for i in A{
        if i == smallest{
            smallest = smallest + 1
        }
    }
   
    return smallest
}
