import SwiftUI

public extension Color {
    struct Primary { }
}

public extension Color.Primary {
    static let primary100: Color = DesignSystemAsset.Primary.primary100.swiftUIColor
    static let primary300: Color = DesignSystemAsset.Primary.primary300.swiftUIColor
}
