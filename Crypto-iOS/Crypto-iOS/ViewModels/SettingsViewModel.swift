import Foundation
import FirebaseAuth
@Observable
final class SettingsViewModel{
    var email: String = ""
    var password: String = ""

    var showError = false
    var errorMessage: String = ""

    var isLogedIn = false

    func login() async {
        do {
            try await Auth.auth().signIn(
                withEmail: email,
                password: password
            )
            isLogedIn = true
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            // TODO: handle error
        }
    }
}
