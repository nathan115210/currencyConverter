//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Hongyu Zhao on 16.1.2025.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) { // 3 grid Items in a row
            
            ForEach(Currency.allCases) { currencyItem in
                if(currencyItem == selectedCurrency) {
                    SelectCurrencyIcon(currencyImage: currencyItem.image, currencyName: currencyItem.name)
                    // Add border to the image - START
                        .shadow(color: .red, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.75)
                        }
                    // Add border to the image - END
                } else {
                    SelectCurrencyIcon(currencyImage: currencyItem.image, currencyName: currencyItem.name)
                        .onTapGesture {
                            selectedCurrency = currencyItem
                        }
                }
            }
        }
    }
}


#Preview {
    @Previewable @State var selectedCurrency: Currency = .copperPenny
    IconGrid(selectedCurrency: $selectedCurrency)
}
