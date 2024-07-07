//
//  FlashCardModel.swift
//  FlashCard
//
//  Created by Amberley Harris on 7/6/24.
//

import Foundation
import FirebaseFirestoreSwift

struct DeckModel : Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var cards: [[String: String]]
}
