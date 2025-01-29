//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Hongyu Zhao on 16.1.2025.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss // Dismiss
    // The property wrapper @Binding is used to create a two-way connection between a view and its parent. When the value of the property changes, the view will be updated. When the view changes the value of the property, the parent will be updated.
    // => Like the props, the parent can pass the value to the child, and the child can change the value and pass it back to the parent.
    @Binding var startWith: Currency
    @Binding var convertTo: Currency
    
    var body: some View {
        ZStack {
            // Parchment background image
            // Background Image of the App
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text for Currency starting with
                Text("Select the currency you are starting with: \(Currency.copperPenny.rawValue)")
                    .fontWeight(.bold)
                
                // Curreny icons
                IconGrid(selectedCurrency: $startWith)
                
                
                // Text for Currency convert to
                Text("Select the currency you want to convert to:")
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                // Curreny icons
                IconGrid(selectedCurrency: $convertTo)
                
                // Dismiss button
                
                Button("Done") {
                    // Button action
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .foregroundStyle(.white)
                //TODO: check if 2 currency are the same
                //.disabled(startCurrency == targetCurrency)
            }
            .padding()
            .multilineTextAlignment(.center) // Align all the text inside of this VStack to be centered
            .foregroundStyle(.black)
        }
    }
}


#Preview {
    @Previewable @State var startWith: Currency = .copperPenny
    @Previewable @State var convertTo: Currency = .silverPenny
    SelectCurrency(startWith: $startWith, convertTo: $convertTo)
}
