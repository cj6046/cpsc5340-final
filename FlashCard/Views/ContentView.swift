//
//  ContentView.swift
//  FlashCard
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var flashCardApp = FlashCardViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(flashCardApp.decks) { deck in
                    NavigationLink {
                        DeckView(deck: deck)
                    } label: {
                        Text(deck.title)
                    }
                }
                Section {
                    NavigationLink {
                        CreateDeckView()
                    } label: {
                        Text("Add Deck")
                    }
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                }
            }
            .navigationTitle("Master Memory")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            flashCardApp.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
