import SwiftUI

public struct InputButton: View {
    var text: String
    var style: InputButtonType
    var action: () -> Void

    public init(
        text: String,
        style: InputButtonType,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.action = action
    }

    public var body: some View {
        Button(text, action: action)
            .buttonStyle(InputButtonStyle(style: style))
    }
}
