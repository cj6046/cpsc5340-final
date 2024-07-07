//
//  CreateDeckView.swift
//  FlashCard
//

import SwiftUI

struct CreateDeckView: View {
    
    @StateObject var flashCardApp = FlashCardViewModel()
    
    @State var newDeck = DeckModel(title: "", cards: [])
    
    var body: some View {
        HStack {
            List {
                Section {
                    VStack(alignment: .leading, content: {
                        Text("Deck Title")
                        TextField("My New Deck", text: $newDeck.title)
                    })
                }
                ForEach(0..<newDeck.cards.count, id: \.self) { index in
                    VStack{
                        Text(newDeck.cards[index]["front"]!)
                        Text(newDeck.cards[index]["back"]!)
                    }
                    .multilineTextAlignment(.center)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            newDeck.cards.remove(at: index)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                Section {
                    NavigationLink {
                        CreateCardView(cards: $newDeck.cards, addCard: { newCard in
                            self.newDeck.cards.append(newCard)
                        })
                    } label: {
                        Text("Add Card")
                    }
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                }
            }
            .navigationTitle("New Cards")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        flashCardApp.saveData(deck: newDeck)
                    } label: {
                        Text("save")
                    }
                }
            }
        }
    }
}

#Preview {
    CreateDeckView()
}
