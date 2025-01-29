//
//  ExchangeInfoView.swift
//  LOTRConverter
//
//  Created by Hongyu Zhao on 16.1.2025.
//

import SwiftUI

struct ExchangeInfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            // Background image
            Image(.parchment)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                // Heading
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .bold()
                    
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                
                // Exchange Rules
                ExchangeRate(leftImage: .goldpiece, rateText: "1 Gold Pieces = 4 Gold Pennies", rightImage: .copperpenny)
                ExchangeRate(leftImage: .goldpenny, rateText: "1 Gold Pieces = 4 Silver Pieces", rightImage: .silverpiece)
                ExchangeRate(leftImage: .silverpiece, rateText: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, rateText: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
                
                
            }
            .foregroundStyle(.black)
        }
        
    }
}

#Preview {
    ExchangeInfoView()
}

