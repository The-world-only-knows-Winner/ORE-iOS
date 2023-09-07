import SwiftUI

public struct ORIFont: ViewModifier {
    public var style: ORIFontStyle

    public func body(content: Content) -> some View {
        switch style {
        case let .heading(font):
            return content
                .font(.custom("SUIT-\(font.weight)", size: font.size.fontSize))
                .frame(height: font.size.fontHeight)

        case let .body(font):
            return content
                .font(.custom("SUIT-\(font.weight)", size: font.size.fontSize))
                .frame(height: font.size.fontHeight)
        }
    }
}

public extension View {
    func oriFont(_ style: ORIFontStyle) -> some View {
        self
            .modifier(DesignSystem.ORIFont(style: style))
    }

    func oriFont(_ style: ORIFontStyle, color: Color) -> some View {
        self
            .oriFont(style)
            .foregroundColor(color)
    }
}
