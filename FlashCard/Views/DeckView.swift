//
//  DeckView.swift
//  FlashCard
//

import SwiftUI

struct DeckView: View {
    
    @State var deck : DeckModel
    @State private var currentIndex = 0
    @State private var showBack = false
    
    var body: some View {
        VStack {
            Text(deck.title)
                .font(.largeTitle)
                .padding()
            
            Spacer()
            if currentIndex >= 0 && currentIndex < deck.cards.count {
                CardView(card: deck.cards[currentIndex], showBack: $showBack)
                    .frame(maxHeight: .infinity)
                    .aspectRatio(3/4, contentMode: .fill)
                    .onTapGesture {
                        showBack.toggle()
                    }
            } else {
                Text("No more cards!")
                    .font(.title)
                    .padding()
            }
            
            Spacer()
            
            HStack{
                Button(action: {
                    markCard(isCorrect: false)
                }) {
                    Text("Wrong")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: {
                    markCard(isCorrect: false)
                }) {
                    Text("Correct")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
    
    private func markCard(isCorrect: Bool) {
        if isCorrect {
            deck.cards[currentIndex]["isKnown"] = "true"
        }
        moveToNextCard()
    }
    
    private func moveToNextCard() {
        if currentIndex < deck.cards.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = -1
        }
        showBack = false;
    }
}

struct CardView: View {
    let card: [String:String]
    @Binding var showBack: Bool
    
    var body: some View {
        Text(showBack ? card["back"]! : card["front"]!)
            .frame(maxWidth: .infinity, maxHeight: 400)
            .aspectRatio(3/4, contentMode: .fill)
            .font(.title)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
    }
}

#Preview {
    DeckView(deck: DeckModel(title: "Local Deck 1", cards: [
        [
            "front": "local front test",
            "back": "local back test",
            "isKnown": "false"
        ],
    ]))
}
