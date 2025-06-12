
import SwiftUI
struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @State private var email = ""
    @State private var password = ""
    @State private var message = ""
    @State private var colorText : Color = .black
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Iniciar Sesión")
                .font(.title)
                .bold()

            TextField("Correo electrónico", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Contraseña", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Iniciar sesión") {
                AuthService.login(email: email, password: password){
                    token in DispatchQueue.main.async {
                        if let token = token {
                                      appState.token = token
                                      appState.currentScreen = .home
                                  } else {
                                      colorText = .red
                                      message = "Error al iniciar sesión"
                                  }
                    }
                }           }
            .buttonStyle(.borderedProminent)
            Text(message)
                .foregroundColor(colorText)
                .font(.subheadline)
            Spacer().frame(height: 20)
            Divider()
            Button("¿No tienes cuenta? Regístrate") {
                appState.currentScreen = .register
            }
            .font(.footnote)
            .foregroundColor(.blue)
            
        }
        .padding(120)
    }
}


#Preview {
    LoginView()
}

