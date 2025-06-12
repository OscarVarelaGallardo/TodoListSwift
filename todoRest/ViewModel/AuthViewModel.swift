import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var message = ""
    @Published var colorText: Color = .black

    func login(email: String, password: String, appState: AppState) {
        AuthService.login(email: email, password: password) {
            result in
            DispatchQueue.main.async {
                if let result = result {
                    appState.token = result.token
                    appState.id = result.id
                    appState.currentScreen = .home
                } else {
                    self.colorText = .red
                    self.message = "Error al iniciar sesión"
                }
            }
        }
    }
}
