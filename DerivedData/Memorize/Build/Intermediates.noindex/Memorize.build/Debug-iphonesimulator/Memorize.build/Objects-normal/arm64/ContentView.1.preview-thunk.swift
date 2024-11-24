import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/nicholasdalba/Developer/Memorize/Memorize/ContentView.swift", line: 1)
//
//  ContentView.swift
//  Memorize
//
//  Created by Nicholas Alba on 6/27/24.
//

import SwiftUI

struct ContentView: View {
    init(themes: [EmojiTheme], themeIndex: Int) {
        self.themes = themes
        self.themeIndex = themeIndex
        emojis = ContentView.emojiPairsFrom(theme: themes[initialThemeIndex])
    }
    
    var themes: [EmojiTheme]
    @State private var themeIndex: Int
    @State private var emojis: [String]
    
    var body: some View {
        VStack {
            Text(__designTimeString("#10920_0", fallback: "Memorize")).font(.largeTitle).fontWeight(.bold)
            ScrollView {
                cards
            }
            // Spacer()
            // cardCountAdjusters
            themeSelectors
        }
        .padding()
    }
    
    var cards: some View {
        // let columns = [GridItem(.adaptive(minimum: 80))]
        let columns = [GridItem(), GridItem(), GridItem(), GridItem()]
        return LazyVGrid(columns: columns) {
            ForEach(__designTimeInteger("#10920_1", fallback: 0)..<emojis.count, id: \.self) { index in
                CardView(emoji: emojis[index])
                    .aspectRatio(__designTimeInteger("#10920_2", fallback: 2)/__designTimeInteger("#10920_3", fallback: 3), contentMode: .fit)
            }
        }
        .foregroundColor(selectedTheme.color)
    }

    
//    var cardCountAdjusters: some View {
//        HStack {
//            Spacer()
//            cardRemover
//            Spacer()
//            cardAdder
//            Spacer()
//        }
//        .imageScale(.large)
//        .font(.title)
//    }
    
    
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//            cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset > emojis.count || cardCount + offset <= 0)
//    }
//    
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
//    
//    var cardAdder: some View {
//        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
//    }

    
    var themeSelectors: some View {
        HStack {
            Spacer()
            ForEach(__designTimeInteger("#10920_4", fallback: 0)..<themes.count, id: \.self) { index in
                themeSelector(index: index)
            }
        }
    }
    
    func themeSelector(index: Int) -> some View {
        Button(action:  {
            themeIndex = index
            emojis = ContentView.emojiPairsFrom(theme: selectedTheme)
        }, label: {
            let base = RoundedRectangle(cornerRadius: __designTimeInteger("#10920_5", fallback: 12))
            ZStack {
                base.fill(.white)
                base.stroke()
                themeSelectorStack(index: index)
            }
            .foregroundColor(themes[index].color)
            .fixedSize(horizontal: __designTimeBoolean("#10920_6", fallback: false), vertical: __designTimeBoolean("#10920_7", fallback: true))
        })
    }
    
    func themeSelectorStack(index: Int) -> some View {
        VStack {
            Image(systemName: themes[index].symbol)
                .imageScale(.large)
                .scaledToFit()
            Text(themes[index].title)
        }
        .padding()
    }
               
    static func emojiPairsFrom(theme: EmojiTheme) -> [String] {
        var emojiPairs: [String] = []
        for emoji in theme.emojis {
            emojiPairs += [emoji, emoji]
        }
        emojiPairs.shuffle()
        return emojiPairs
    }
    
    var selectedTheme: EmojiTheme {
        themes[themeIndex]
    }
}

#Preview {
    ContentView(themes: themes, themeIndex: initialThemeIndex)
}