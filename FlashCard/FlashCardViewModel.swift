//
//  FlashCardViewModel.swift
//  FlashCard
//
//  Created by Amberley Harris on 7/6/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FlashCardViewModel : ObservableObject {
    
    @Published private(set) var decks = [DeckModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        db.collection("decks")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.decks.append(try document.data(as: DeckModel.self))
                        } catch {
                            print("Error decoding: \(error)")
                        }
                    }
                }
            }
    }
    
    func saveData(deck: DeckModel) {
        var ref: DocumentReference? = nil
        ref = db.collection("decks")
            .addDocument(data: [
                "title": deck.title,
                "cards": deck.cards,
            ]) {
                err in
                if let err = err {
                    print("Error uploading document: \(err)")
                } else {
                    print("Document added successfully! ID: \(ref!.documentID)")
                }
            }
        
        fetchData()
    }
    
}
