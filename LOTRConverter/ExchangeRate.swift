//
//  ExchangeRulesView.swift
//  LOTRConverter
//
//  Created by Hongyu Zhao on 16.1.2025.
//

import SwiftUI

struct ExchangeRate: View {
    // ExchangeRate parameter
    let leftImage: ImageResource
    let rateText: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 30)
            
            Text(rateText)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 30)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silverpiece, rateText: "1 Gold Pieces = 4 Gold Pennies", rightImage: .copperpenny)
}
