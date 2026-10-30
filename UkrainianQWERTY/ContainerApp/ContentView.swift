import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Ukrainian QWERTY")
                .font(.largeTitle.bold())
            Text("Enable the keyboard once in Settings:")
                .font(.headline)
            Text("Settings → General → Keyboard → Keyboards → Add New Keyboard")
                .multilineTextAlignment(.center)
            Text("After enabling it, choose it with the globe key whenever you type. You do not need to reopen this app each time.")
                .multilineTextAlignment(.center)
            Text("This starter provides direct Ukrainian QWERTY key mapping. Autocorrect is not included yet.")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
