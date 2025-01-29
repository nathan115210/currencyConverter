//
//  CurrencyTipKit.swift
//  LOTRConverter
//
//  Created by Hongyu Zhao on 29.1.2025.
//

import TipKit

struct CurrencyTipKit: Tip {
    var title: Text {
        Text("Change currency") // Anotrher way to create a Text tip => var title = Text("Change currency")
    }
    
    
    var message: Text? {
        Text("You can change the currency by tapping on the currency icon, then select the currency you want to convert to.")
    }
    
    var image: Image? = Image(systemName: "hand.tap.fill")
    
}
