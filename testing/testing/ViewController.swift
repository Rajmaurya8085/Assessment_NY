//
//  ViewController.swift
//  testing
//
//  Created by Raj on 20/11/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var string  = " ghhh hggg 13 DUP 4 POP 5 DUP + DUP + -"
        getResust(&string)
        // Do any additional setup after loading the view, typically from a nib.
    }
 var stackArray  = [Int]()

    func getResust(_ S : inout String)->Int{
      
       let substringArray  =   S.components(separatedBy: " ")
        print(substringArray)
        for str in substringArray{
            switch str {
            case "DUP":
                if stackArray.count < 1 {
                    return -1
                }else{
                    duplicat()
                }
                break;
            case "POP":
                if stackArray.count < 1 {
                    return -1
                }else{
               _ = pop()
                }
                break;
            case "+":
                if stackArray.count < 2{
                    return -1
                }else{
                    let value =   pop() + pop()
                    push(value: value)
                }
                break;
            case "-":
                if stackArray.count < 2{
                    return -1
                }else{
                    let value =   pop() - pop()
                    push(value: value)
                }
                
                break;
                 case "":
                    break;
            default:
                if Int(str) != nil  &&  Int(str)! < Int.max{
                    stackArray.insert(Int(str)!, at:0)
                }
                else{
                    return -1
                }
            }
        }
        
        print("value = ", stackArray.first ?? "")
        return stackArray.first ?? 0
    }
    
    func duplicat(){
         let value  = stackArray.first
        stackArray.insert(value!, at: 0)
    }
    func pop()->Int{
        let value  = stackArray.first
        stackArray.remove(at: 0)
        return value ?? 0
    }
    
    func push(value:Int){
     stackArray.insert(value, at: 0)
    }
    
    
//    func oprationImplemtation(str:String) -> Int{
//
//        switch str {
//        case "DUP":
//            if stackArray.count < 1 {
//                return -1
//            }else{
//                duplicat()
//            }
//
//            break;
//        case "POP":
//            pop()
//            break;
//        case "+":
//            if stackArray.count < 2{
//              return -1
//            }else{
//            let value =   pop() + pop()
//               push(value: value)
//            }
//            break;
//        case "-":
//            if stackArray.count < 2{
//             return -1
//            }else{
//                let value =   pop() - pop()
//                push(value: value)
//            }
//
//            break;
//        default:
//            if Int(str) != nil  &&  Int(str)! < Int.max{
//                stackArray.insert(Int(str)!, at:0)
//            }
//        }
//    }
    
    int solution(NSMutableArray *A) {
    int N = [A count];
    int result = 0;
    int i, j;
    for (i = 0; i < N; i++)
    for (j = 0; j < N; j++)
    if ([[A objectAtIndex: i] intValue] == [[A objectAtIndex: j] intValue])
    if (abs(i - j) > result)
    result = abs(i - j);
    return result;
    }
}

