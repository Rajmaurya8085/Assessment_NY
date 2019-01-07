import UIKit

var str = "Hello, playground"


import Foundation

func readInput() -> (Int, [Int], Int) {
    let line1 = readLine()!
    let line2 = readLine()!
    let line3 = readLine()!
    
    let denominationCount = Int(line1)!
    let denominations: [Int] = denominationCount == 0 ? [] : line2.components(separatedBy: " ").map { (bankNote) -> Int in
        return Int(bankNote)!
    }
    
    let rent = Int(line3)!
    
    return (denominationCount, denominations, rent)
}

// DO NOT MODIFY anything outside the below function
func numberOfWaysToPay(_ denominationCount: Int, _ denominations: [Int], _ rent: Int) -> Int {
    if (rent == 0){
        return 1;
    }
    
    // If n is less than 0 then no
    // solution exists
    if (rent < 0){
    return 0;
    }
    
    // If there are no coins and n
    // is greater than 0, then no
    // solution exist
    if ( denominationCount <= 0 && rent >= 1){
    return 0;
    }
    
    return numberOfWaysToPay(denominationCount - 1 , denominations , rent ) + numberOfWaysToPay(denominationCount ,denominations , rent-denominations[denominationCount-1] )
}
// DO NOT MODIFY anything outside the above function

let (denominationCount, denominations, rent) = readInput()
let result = numberOfWaysToPay(denominationCount, denominations, rent)

print(result)
