//
//  Section.swift
//  Design-SwiftUI
//
//  Created by Maxim Granchenko on 23.04.2021.
//

import SwiftUI

struct Section: Identifiable {
    let id = UUID()
    let title: String
    let lesson: String
    let image: String
    let bgColor: Color
}
