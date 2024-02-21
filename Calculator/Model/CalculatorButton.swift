//
//  CalculatorButton.swift
//  Calculator
//
//  Created by iCommunity app on 21/02/2024.
//

import Foundation

struct CalculatorButton: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let color: CalculatorColor
    var buttonText: String? = nil
    var action: Action? = nil
    
    static func == (lhs: CalculatorButton, rhs: CalculatorButton) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
