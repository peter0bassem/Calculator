//
//  ContentView.swift
//  Calculator
//
//  Created by iCommunity app on 21/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack(spacing: 0.0) {
            Spacer()
            
            HStack {
                Spacer()
                
                Text(viewModel.display.addNumberCommas())
                    .font(.system(size: 90, weight: .light))
                    .foregroundStyle(Color.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            
            ForEach(Constants.calculatorButtons, id: \.self) { row in
                HStack {
                    ForEach(row) { button in
                        CalculatorButtonView(calculatorButton: button) {
                            viewModel.buttonPressed(button)
                        }
                        .environmentObject(viewModel)
                    }
                }
                .padding(.bottom, Constants.padding)
            }
        }
        .padding()
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}
