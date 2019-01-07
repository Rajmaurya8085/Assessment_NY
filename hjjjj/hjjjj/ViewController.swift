//
//  ViewController.swift
//  hjjjj
//
//  Created by Raj on 09/12/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let userLoggedIn: Bool? = false
        
//        if !userLoggedIn! {
//            print("Message one")
//        } else {
//            print("Message two")
//        }
        //let result = fetchCrewMember().0
        // Do any additional setup after loading the view, typically from a nib.
        
//        let (denominationCount, denominations, rent) = readInput()
//        let result = numberOfWaysToPay2(denominationCount, denominations, rent)
//
//        print(result)
        guard let url  =  URL(string: "") else{ return }
        var request  = URLRequest(url:url)
          request.httpMethod = "put"
    
     
        
    }

    func fetchCrewMember() -> (job: String, name: String) {
        return ("Public Relations", "Jayne")
    }
//    3
//    1 2 5
//    6
    func readInput() -> (Int, [Int], Int) {
        let line1 = readLine()
        let line2 = readLine()
        let line3 = readLine()
        
        let denominationCount = Int(line1 ?? "3")!
        let denominations: [Int] = denominationCount == 0 ? [] : line2?.components(separatedBy: " ").map { (bankNote) -> Int in
            return Int(bankNote)!
            } ?? [1,2,5]
        
        let rent = Int(line3 ?? "6")!
        
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
        print(denominationCount, denominations, rent)
        if ( denominationCount <= 0 && rent >= 1){
            return 0;
        }
        
        return numberOfWaysToPay(denominationCount - 1 , denominations , rent ) + numberOfWaysToPay(denominationCount ,denominations , rent-denominations[denominationCount-1] )
    }
    // DO NOT MODIFY anything outside the above function
    
    // C++ program for coin change problem.
   
    
   // int count( int S[], int m, int n )
     func numberOfWaysToPay2(_ denominationCount: Int, _ denominations: [Int], _ rent: Int) -> Int
    {
        var  i = 0,  j = 0, x = 0, y = 0;
    
    // We need n+1 rows as the table
    // is constructed in bottom up
    // manner using the base case 0
    // value case (n = 0)
        var  table:[[Int]] = [[Int]]();
    
    // Fill the enteries for 0
    // value case (n = 0)
    //for (i = 0; i < denominationCount; i++)
        for i in 0..<denominationCount {
            
    table[0][i] = 1;
        }
    // Fill rest of the table entries
    // in bottom up manner
  //  for (i = 1; i < rent + 1; i++)
    for i in 1..<rent
    {
         for j in 0..<denominationCount
  //  for (j = 0; j < m; j++)
    {
    // Count of solutions including S[j]
    x = (i-denominations[j] >= 0) ? table[i - denominations[j]][j] : 0;
    
    // Count of solutions excluding S[j]
    y = (j >= 1) ? table[i][j - 1] : 0;
    
    // total count
    table[i][j] = x + y;
    }
    }
    return table[rent][denominationCount - 1];
    }
    
    // Driver Code
   
    
    // This code is contributed
    // by Akanksha Rai(Abby_akku)

   
}

