import Foundation


class AppState: ObservableObject {
    @Published var currentScreen: Screen = .login
    @Published var token: String? = nil
    @Published var id : Int? = nil

    enum Screen {
        case login
        case register
        case home
    }

    func logout() {
        currentScreen = .login
        token = nil
    }

    func login(token: String, id: Int) {
        self.token = token
        self.id = id
        currentScreen = .home
    }
}
