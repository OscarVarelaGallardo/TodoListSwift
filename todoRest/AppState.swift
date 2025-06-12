import Foundation


class AppState: ObservableObject {
    @Published var currentScreen: Screen = .login
    @Published var token: String? = nil

    enum Screen {
        case login
        case register
        case home
    }

    func logout() {
        currentScreen = .login
        token = nil
    }

    func login(token: String) {
        self.token = token
        currentScreen = .home
    }
}
