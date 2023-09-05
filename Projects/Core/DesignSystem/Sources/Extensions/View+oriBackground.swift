import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
                Color.GrayScale.gray100
                    .ignoresSafeArea()
            }
    }
}

public extension View {
    func oriBackground() -> some View {
        modifier(BackgroundModifier())
    }
}
