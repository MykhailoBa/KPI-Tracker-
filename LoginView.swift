import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @State private var isUnlocked = false

    var body: some View {
        if isUnlocked {
            MainView()
        } else {
            VStack {
                Text("Enter your passcode")
                    .font(.title)
                    .padding()

                Button("Face ID") {
                    authenticate()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal, 20)
            }
        }
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Для входу") { success, _ in
                if success {
                    DispatchQueue.main.async {
                        self.isUnlocked = true
                    }
                }
            }
        }
    }
}
