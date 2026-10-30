import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Ukrainian QWERTY")
                    .font(.largeTitle.bold())
                Text("A Ukrainian Cyrillic keyboard using familiar English QWERTY key positions.")
                Text("Enable the keyboard")
                    .font(.headline)
                Text("1. Open Settings.\n2. Go to General → Keyboard → Keyboards.\n3. Tap Add New Keyboard and choose Ukrainian QWERTY.\n4. In an app, hold the globe key to switch keyboards.")
                Text("The keyboard works inside text fields after it has been installed and enabled. This starter build does not include predictive text or autocorrect yet.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
