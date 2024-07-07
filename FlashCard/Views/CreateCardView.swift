//
//  CreateCardView.swift
//  FlashCard
//
//  Created by Amberley Harris on 7/6/24.
//

import SwiftUI

struct CreateCardView: View {
    
    @Binding var cards: [[String:String]]
    @State private var frontText = ""
    @State private var backText = ""
    
    var addCard: ([String:String]) -> Void
    
    var body: some View {
        Form {
            Section(header: Text("Create New Card")) {
                TextField("Front of Card", text: $frontText)
                TextField("Back of Card", text: $backText)
            }
            Button("Add Card") {
                let newCard = [
                    "front": frontText,
                    "back": backText,
                    "isKnown": "false"
                ]
                addCard(newCard)
                
                // Clear input
                frontText = ""
                backText = ""
            }
        }
    }
}

#Preview {
    
    CreateCardView(
        cards: .constant([]),
        addCard: { _ in }
    )
}
