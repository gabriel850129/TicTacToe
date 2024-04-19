//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Gabriel Estévez López on 4/18/24.
//

import SwiftUI

@main
struct TicTacToeApp: App {
   @State private var juego = Juego()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(juego)
        }
    }
}
