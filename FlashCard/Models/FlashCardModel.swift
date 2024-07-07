//
//  FlashCardModel.swift
//  FlashCard
//

import Foundation
import FirebaseFirestoreSwift

struct DeckModel : Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var cards: [[String: String]]
}
