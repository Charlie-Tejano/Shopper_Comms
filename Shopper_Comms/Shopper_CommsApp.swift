//
//  Shopper_CommsApp.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import SwiftUI

@main
struct Shopper_CommsApp: App {
    @StateObject private var store = LocalPromptStore()
    @State private var isShowingSplash = true

    var body: some Scene {
        WindowGroup {
            if isShowingSplash {
                SplashView()
                    .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation(.easeOut(duration: 0.4)) {
                                isShowingSplash = false
                            }
                        }
                    }
            } else {
                ContentView()
                    .environmentObject(store)
                    .transition(.opacity)
            }
        }
    }
}
