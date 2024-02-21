//
//  CalculatorButtonStyle.swift
//  Calculator
//
//  Created by iCommunity app on 21/02/2024.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    let size: CGFloat
    let backgoundColor: Color
    let foregroundColor: Color
    var wide: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 30, weight: .medium))
            .frame(width: size, height: size)
            .frame(maxWidth: wide ? .infinity : size, alignment: .leading)
            .background(backgoundColor)
            .foregroundStyle(foregroundColor)
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.25)
                }
            }
            .clipShape(Capsule())
    }
}

#Preview {
    Button {
        
    } label: {
        Text("0")
    }
    .buttonStyle(CalculatorButtonStyle(size: 50, backgoundColor: .orange, foregroundColor: .white))
}
