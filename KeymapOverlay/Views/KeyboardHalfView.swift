import SwiftUI

struct KeyboardHalfView: View {
    let half: KeyHalf
    let keys: [KeyDefinition]
    var layout: KeyboardLayoutType = AppSettings.shared.keyboardLayout

    var body: some View {
        VStack(spacing: KeyboardMetrics.keySpacing) {
            ForEach(layout.mainRows(for: half, keys: keys), id: \.first?.id) { row in
                HStack(spacing: KeyboardMetrics.keySpacing) {
                    ForEach(row) { key in
                        KeyView(key: key)
                    }
                }
            }

            HStack(spacing: KeyboardMetrics.keySpacing) {
                if half == .left {
                    Spacer()
                }
                ForEach(layout.thumbKeys(for: half, keys: keys)) { key in
                    KeyView(key: key)
                }
                if half == .right {
                    Spacer()
                }
            }
        }
    }
}

#Preview("Left Half - Corne") {
    KeyboardHalfView(half: .left, keys: CorneLayout.defaultKeys, layout: .corne)
        .padding()
}

#Preview("Right Half - Corne") {
    KeyboardHalfView(half: .right, keys: CorneLayout.defaultKeys, layout: .corne)
        .padding()
}

#Preview("Left Half - Sofle") {
    KeyboardHalfView(half: .left, keys: SofleLayout.defaultKeys, layout: .sofle)
        .padding()
}

#Preview("Right Half - Sofle") {
    KeyboardHalfView(half: .right, keys: SofleLayout.defaultKeys, layout: .sofle)
        .padding()
}
