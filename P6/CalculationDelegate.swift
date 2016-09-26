//
//  CalculationDelegate.swift
//  Calculator
//
//  Created by Cal Stephens on 9/26/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

import Foundation


//MARK: - Protocols that can be implemented yourself if you'd like

protocol CalculationDelegate {
    
    var previousExpressions: [(expression: String, result: String)] { get set }
    var currentOperator: Operator? { get set }
    
    var leftNumber: Double? { get set }
    var rightNumber: Double? { get set }
    var resultNumber: Double { get }
    
    var expressionString: String { get }
    
    func handleInput(_ number: Int)
    func setOperator(_ newOperator: Operator)
    func clearInputAndSave(_ save: Bool)
    
}

protocol Operator {
    
    var character: String { get }
    var operate: (Double, Double) -> Double { get }
    init(forCharacter character: String, withFunction: @escaping (Double, Double) -> Double)
    
}


//MARK: - Default Implementation of the Calculation Protocol

class DefaultCalculationDelegate : CalculationDelegate {
    
    var previousExpressions: [(expression: String, result: String)] = []
    var currentOperator: Operator?
    
    var leftNumber: Double?
    var rightNumber: Double?
    var resultNumber: Double {
        if let leftNumber = leftNumber {
            return rightNumber ?? leftNumber
        }
        return leftNumber ?? Double(previousExpressions.last?.result ?? "a") ?? 0.0
    }
    
    var expressionString: String {
        if let left = leftNumber?.roundedString {
            if let operatorChar = currentOperator?.character {
                let right = rightNumber?.roundedString ?? "0"
                return "\(left) \(operatorChar) \(right) = "
            }
            return "\(left) = "
        }
        return "0 = "
    }
    
    func handleInput(_ input: Int) {
        
        //fixes equals bug where it would just append to the end of the previous answer
        if expressionString == "" {
            leftNumber = nil
        }
        
        //update the left number until the operator has been set
        let useLeft = (currentOperator == nil)
        
        //update numbers
        let optionalNumber = useLeft ? leftNumber : rightNumber
        var newNumber = optionalNumber ?? 0.0
        newNumber = (newNumber * 10) + Double(input)
        
        if useLeft { leftNumber = newNumber }
        else { rightNumber = newNumber }
    }
    
    func setOperator(_ newOperator: Operator) {
        if leftNumber == nil {
            leftNumber = Double(previousExpressions.last?.result ?? "a") ?? 0.0
        }
        
        //if there's a number on the Right,
        if rightNumber != nil {
            clearInputAndSave(true)
            leftNumber = resultNumber
        }
        
        currentOperator = newOperator
    }
    
    func clearInputAndSave(_ save: Bool) {
        
        if !save {
            previousExpressions.append((expression: "cleared", result: ""))
        }
        
        let result = currentOperator?.operate(leftNumber ?? 0.0, rightNumber ?? 0.0)
        
        if leftNumber != nil || rightNumber != nil || currentOperator != nil {
            if let result = result {
                previousExpressions.append((expression: expressionString, result: "\(result)"))
            }
        }
        
        leftNumber = nil
        rightNumber = nil
        currentOperator = nil
    }
    
}


//MARK: - Default Implementation of the Operator protocol

struct DefaultOperator : Operator {
    
    var character: String
    var operate: (Double, Double) -> Double
    
    init(forCharacter character: String, withFunction operate: @escaping (Double, Double) -> Double) {
        self.character = character
        self.operate = operate
    }
    
}


//MARK: - Double Extension, adds .roundedString variable

extension Double {
    
    var roundedString: String {
        let rounded = self.rounded() / 100
        let string = "\(rounded)"
        return string.hasSuffix(".0") ? "\(Int(self))" : string
    }
    
}
