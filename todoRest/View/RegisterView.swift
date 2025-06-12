import SwiftUI

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var appState: AppState
    @State private var email = ""
    @State private var password = ""
    @State private var message = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Registro")
                .font(.title)
                .bold()

            TextField("Correo electrónico", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Contraseña", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Registrarse") {
                AuthService.register(email: email, password: password) { success in
                    DispatchQueue.main.async {
                        message = success ? "Registro exitoso" : "Error al registrarse"
                    }
                }
            }
            .buttonStyle(.borderedProminent)

            Text(message)
                .foregroundColor(.blue)
                .font(.subheadline)

            Divider()

            Button("¿Ya tienes cuenta? Inicia sesión") {
                appState.currentScreen = .login
            }
            .font(.footnote)
            .foregroundColor(.blue)
        }
        .padding(120)
    }
}

#Preview {
    RegisterView()
}
