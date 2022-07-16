//
//  CardData.swift
//  Parallax-SwiftUI
//
//  Created by Kevin ahmad on 16/07/22.
//

import SwiftUI

struct CardData: Identifiable {
    var id = UUID()
    var name: String
    var frontImage: String
    var backgroundImage: String
}

var cardDatas: [CardData] = [
    CardData(name: "Brazil", frontImage: "rio", backgroundImage: "rio-bg"),
    CardData(name: "France", frontImage: "france", backgroundImage: "france-bg"),
    CardData(name: "Iceland", frontImage: "iceland", backgroundImage: "iceland-bg")
]
