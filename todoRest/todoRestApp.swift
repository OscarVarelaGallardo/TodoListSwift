

import SwiftUI

@main
struct todoRestApp: App {
    @StateObject var appState = AppState()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
            }
        }
    }

