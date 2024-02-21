//
//  CalculatorButtonView.swift
//  Calculator
//
//  Created by iCommunity app on 21/02/2024.
//

import SwiftUI

struct CalculatorButtonView: View {
    @EnvironmentObject private var viewModel: ContentViewModel
    
    let calculatorButton: CalculatorButton
    let action: (() -> Void)?
    
    var backgorundColor: Color {
        if let action = calculatorButton.action,
           action == viewModel.action,
           viewModel.shouldClear,
           viewModel.newAction {
            return .white
        } else {
            return Color(calculatorButton.color.rawValue)
        }
    }
    
    var foregroundColor: Color {
        if let action = calculatorButton.action,
           action == viewModel.action,
           viewModel.shouldClear,
           viewModel.newAction {
            return Color("Orange")
        } else if calculatorButton.color == .lightGray {
            return .black
        } else {
            return .white
        }
    }
    
    var wide: Bool {
        if let text = calculatorButton.buttonText {
            return text == "0"
        } else { return false }
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            if let text = calculatorButton.buttonText {
                if text == "AC" {
                    if viewModel.display == "0" {
                        Text(text)
                    } else {
                        Text("C")
                    }
                } else {
                    Text(text)
                }
            } else if let action = calculatorButton.action {
                Image(systemName: action.rawValue)
            }
        }
        .buttonStyle(CalculatorButtonStyle(size: getSize(), backgoundColor: backgorundColor, foregroundColor: foregroundColor, wide: wide))
    }
    
    private func getSize() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let buttonCount: CGFloat = 4
        let spacingCount = buttonCount + 1
        return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
    }
}

#Preview {
    CalculatorButtonView(calculatorButton: .init(color: .orange, buttonText: "0"), action: nil)
}
