//
//  EmojiTheme.swift
//  Memorize
//
//  Created by Nicholas Alba on 6/29/24.
//

import Foundation
import SwiftUI

struct EmojiTheme {
    var color: Color
    var emojis: [String]
    var symbol: String
    var title: String
}

let halloweenTheme = EmojiTheme(color: .orange, emojis: ["🎃", "👻", "🕷️", "🕸️", "😈", "🙀", "☠️", "🧙", "💀", "😱", "🍭", "👹"], symbol: "moon.fill", title: "Halloween")
let christmasTheme = EmojiTheme(color: Color(hex: 0x7e121d), emojis: ["🎅", "🧝", "🎄", "🎁", "🦌", "🍷", "☃️", "❄️", "🕯️", "🍪", "⭐", "🎶" ], symbol: "gift.fill", title: "Christmas")
let flagTheme = EmojiTheme(color: .blue, emojis: ["🏳️‍🌈", "🏳️‍⚧️", "🇧🇹", "🇵🇸", "🇪🇬", "🇨🇳", "🇰🇵", "🇰🇷", "🇲🇽", "🇦🇲", "🇱🇦", "🇹🇭"], symbol: "flag.fill", title: "Flags")

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double((hex >> 0) & 0xff) / 255,
            opacity: alpha
        )
    }
}
