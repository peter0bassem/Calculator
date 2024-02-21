//
//  Constants.swift
//  Calculator
//
//  Created by iCommunity app on 21/02/2024.
//

import Foundation

class Constants {
    
    static let padding: CGFloat = 10.0
    
    static let calculatorButtons = [[CalculatorButton(color: .lightGray, buttonText: "AC"), CalculatorButton(color: .lightGray, action: .plusMinus), CalculatorButton(color: .lightGray, buttonText: "%"), CalculatorButton(color: .orange, action: .divide)],
                                    [CalculatorButton(color: .darkGray, buttonText: "7"), CalculatorButton(color: .darkGray, buttonText: "8"), CalculatorButton(color: .darkGray, buttonText: "9"), CalculatorButton(color: .orange, action: .multiply)],
                                    [CalculatorButton(color: .darkGray, buttonText: "4"), CalculatorButton(color: .darkGray, buttonText: "5"), CalculatorButton(color: .darkGray, buttonText: "6"), CalculatorButton(color: .orange, action: .subtract)],
                                    [CalculatorButton(color: .darkGray, buttonText: "1"), CalculatorButton(color: .darkGray, buttonText: "2"), CalculatorButton(color: .darkGray, buttonText: "3"), CalculatorButton(color: .orange, action: .add)],
                                    [CalculatorButton(color: .darkGray, buttonText: "0"), CalculatorButton(color: .darkGray, buttonText: "."), CalculatorButton(color: .orange, action: .equals)]]
}

enum CalculatorColor: String {
    case lightGray = "LightGray"
    case darkGray = "DarkGray"
    case orange = "Orange"
}

enum Action: String {
    case plusMinus = "plus.forwardslash.minus"
    case divide = "divide"
    case multiply = "multiply"
    case subtract = "minus"
    case add = "plus"
    case equals = "equal"
}

extension String {
    func addNumberCommas() -> String {
        let arr = self.components(separatedBy: ".")
        if arr.first?.count ?? 0 < 4 {
            return self
        } else {
            var string = arr.first ?? ""
            for i in stride(from: string.count - 3, to: 0, by: -3) {
                let index = string.index(string.startIndex, offsetBy: i)
                string.insert(",", at: index)
            }
            
            if arr.count > 1 {
                let endComponent = arr[1]
                string.append(".")
                string.append(endComponent)
            }
            return string
        }
    }
}
