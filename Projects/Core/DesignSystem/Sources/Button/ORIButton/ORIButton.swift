import SwiftUI

public struct ORIButton: View {
    var text: String
    var style: ORIButtonType
    var isFocused: Bool
    var isPadding: Bool
    var action: () -> Void

    public init(
        text: String,
        style: ORIButtonType = .default,
        isFocused: Bool = false,
        isPadding: Bool = true,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.isFocused = isFocused
        self.isPadding = isPadding
        self.action = action
    }

    public var body: some View {
        Button(text, action: action)
            .buttonStyle(ORIButtonStyle(style: style))
            .cornerRadius(isFocused ? 0 : 12)
            .padding(.vertical, isFocused ? 0 : 8)
            .padding(.horizontal, isFocused || !isPadding ? 0 : 20)
            .animation(.default, value: isFocused)
    }
}
