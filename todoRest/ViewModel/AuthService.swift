import Foundation

struct AuthResponse: Codable {
    let token: String
}

class AuthService {
    static let baseURL = "http://localhost:3000"
    
    static func register(email: String, password: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseURL)/auth/register") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["email": email, "password": password]
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard data != nil, error == nil else {
                completion(false)
                return
            }
            completion(true)
        }.resume()
    }
    
    static func login(email: String, password: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: "\(baseURL)/auth/login") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["email": email, "password": password]
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error en la petición: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Código de estado HTTP: \(httpResponse.statusCode)")
            }
            
            if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                print("Respuesta cruda del backend: \(responseString ?? "sin datos")")
                
                let auth = try? JSONDecoder().decode(AuthResponse.self, from: data)
                completion(auth?.token)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
}
