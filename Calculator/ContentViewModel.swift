//
//  ContentViewModel.swift
//  Calculator
//
//  Created by iCommunity app on 21/02/2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var display: String = "0"
    @Published var action: Action?
    @Published var shouldClear: Bool = false
    @Published var newAction: Bool = false
    
    private var leftNumber: String? = nil
    private var rightNumber: String? = nil
    
    func buttonPressed(_ button: CalculatorButton) {
        if button.buttonText == "AC" {
            clearAll()
        } else if let text = button.buttonText {
            guard display.count < 9 && !(text == "." && display.contains(".")) else { return }
            
            if text == "%",
               let displayNum = Double(display) {
                let answer = displayNum / 100.0
                display = convertToString(answer)
            } else if shouldClear || (display == "0" && text != ".") {
                display = text
                shouldClear = false
            } else {
                display.append(text)
            }
        } else if let action = button.action {
            if leftNumber == nil {
                leftNumber = display
            } else if rightNumber == nil || newAction {
                rightNumber = display
                newAction = false
            }
            
            
            switch action {
            case .plusMinus:
                if display.contains("-") {
                    display.removeFirst()
                } else {
                    display.insert("-", at: display.startIndex)
                }
            case .divide:
                self.action = .divide
                newAction = true
            case .multiply:
                self.action = .multiply
                newAction = true
            case .subtract:
                self.action = .subtract
                newAction = true
            case .add:
                self.action = .add
                newAction = true
            case .equals:
                solve()
            }
            
            shouldClear = true
        }
    }
    
    private func clearAll() {
        display = "0"
        action = nil
        shouldClear = false
        newAction = false
        leftNumber = nil
        rightNumber = nil
    }
    
    private func convertToString(_ number: Double) -> String {
        return String(format: "%g", number)
    }
    
    private func solve() {
        guard let action = action,
              let leftNumber = leftNumber,
              let leftDouble = Double(leftNumber),
              let rightNumber = rightNumber,
              let rightDouble = Double(rightNumber) else { return}
        
        switch action {
        case .divide:
            let answer = leftDouble / rightDouble
            display = convertToString(answer)
        case .multiply:
            let answer = leftDouble * rightDouble
            display = convertToString(answer)
        case .subtract:
            let answer = leftDouble - rightDouble
            display = convertToString(answer)
        case .add:
            let answer = leftDouble + rightDouble
            display = convertToString(answer)
        default: return
        }
        self.leftNumber = display
    }
}
