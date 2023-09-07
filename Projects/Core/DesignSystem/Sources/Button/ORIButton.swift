import SwiftUI

public struct ORIButton: View {
    var text: String
    var style: ButtonType
    var action: () -> Void

    public init(
        text: String,
        style: ButtonType,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.action = action
    }

    public var body: some View {
        Button(text, action: action)
            .buttonStyle(ORIButtonStyle(style: style))
    }
}
