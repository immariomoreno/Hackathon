//
//  CardModel.swift
//  AppMam
//
//  Created by Mario Moreno on 4/2/25.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let emoji: String
    let topic: String
    let description: String
    let image: String
}

enum DiseaseColorType: CaseIterable {
    case morada, azul, cyan
}
