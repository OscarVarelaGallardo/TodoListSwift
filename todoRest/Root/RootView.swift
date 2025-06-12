//
//  RootView.swift
//  todoRest
//
//  Created by Oscar Varela on 12/06/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            Group {
                switch appState.currentScreen {
                case .login:
                    AnyView(LoginView()
                        .transition(.move(edge: .trailing)))
                case .register:
                    AnyView(RegisterView()
                        .transition(.move(edge: .leading)))
                case .home:
                    AnyView(TaskListView())
                }
            }
            // ⚠️ Este `.id(...)` forza a SwiftUI a reconocer un cambio real de vista
            .id(appState.currentScreen)
        }
        .animation(.easeInOut, value: appState.currentScreen)
    }
}
