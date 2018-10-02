//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let value = args[args.count - 1]
        
        switch value {
        case "avg", "fact", "count":
            let count = args.count - 1
            let command = args[args.count - 1]
            
            if(command == "count"){
                return count
            } else if(command == "avg"){
                var total = 0
                var index = 0
                while(index < args.count - 1) {
                    total += (args[index] as NSString).integerValue
                    index += 1
                }
                if(count == 0){
                    return 0
                }else{
                    return(total/count)
                }
            } else if(command == "fact") {
                var num = (args[0] as NSString).integerValue
                var answer = num
                while(num > 1) {
                    answer *= num - 1
                    num -= 1
                }
                return answer
            }
        default:
            let left = (args[0] as NSString).integerValue
            let right = (args[2] as NSString).integerValue
            let opperand = args[1]
            
            if(opperand == "+"){
                return(left + right)
            }else if(opperand == "-"){
                return(left - right)
            }else if(opperand == "/"){
                return(left / right)
            }else if(opperand == "*"){
                return(left * right)
            }else if(opperand == "%"){
                return(left % right)
            }
        }
        return 0
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate(arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

