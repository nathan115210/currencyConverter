//
//  SelectCurrencyIcon.swift
//  LOTRConverter
//
//  Created by Hongyu Zhao on 16.1.2025.
//

import SwiftUI

struct SelectCurrencyIcon: View {
    // SelectCurrencyIcon properties
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Currency image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            // Currency image
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity) // .infinity is the maximum width it can be
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}


#Preview {
    SelectCurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper")
}
