import SwiftUI

public struct ORIToggle: View {
    @Binding var isOn: Bool

    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(ORIToggleStyle())
    }
}

struct ORIToggle_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, world!")
    }
}
