//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nicholas Alba on 6/27/24.
//

import SwiftUI

let themes = [halloweenTheme, christmasTheme, flagTheme]
let initialThemeIndex = 0

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(themes: themes, themeIndex: initialThemeIndex)
        }
    }
}
