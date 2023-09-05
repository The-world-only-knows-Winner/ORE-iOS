import SwiftUI

public extension Color {
    struct State { }
}

public extension Color.State {
    static let red: Color = DesignSystemAsset.State.red.swiftUIColor
    static let green: Color = DesignSystemAsset.State.green.swiftUIColor
}
