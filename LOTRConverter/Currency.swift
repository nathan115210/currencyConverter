//
//  Currency.swift
//  LOTRConverter
//
//  Created by Hongyu Zhao on 27.1.2025.
//
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    // Define the cases for the currency
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    // Define the id for each currency by using the current value of the enum
    // => "self" is the current value of the enum, above currency cases: copperPenny, silverPenny, silverPiece, goldPenny, goldPiece
    var id: Currency { self }
    
    // Define the image for each currency
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    // Define the name for each currency
    var name: String {
        switch self {
        case .copperPenny:
            "Cooper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    // convert currency function
    func convert(amountString: String, currency: Currency) -> String {
        guard let dopubleAmout: Double = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (dopubleAmout / self.rawValue ) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount) // 2 decimal places
    }
}

