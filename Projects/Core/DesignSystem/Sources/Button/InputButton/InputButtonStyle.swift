import SwiftUI

public struct InputButtonStyle: ButtonStyle {
    var style: InputButtonType

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .main:
            MainButton(configuration: configuration)
        case .sub:
            SubButton(configuration: configuration)
        }
    }
}

// MARK: - Usage
extension Button {
    func inputButtonStyle(_ style: InputButtonType) -> some View {
        self.buttonStyle(InputButtonStyle(style: style))
    }
}

// MARK: - Main
extension InputButtonStyle {
    struct MainButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorScheme) private var scheme
        var isLightModel: Bool { scheme == .light }
        var body: some View {
            configuration.label
                .oriFont(
                    .body(.body3),
                    color: isLightModel ?
                        .GrayScale.gray100 :
                            .GrayScale.gray700
                )
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(
                    isEnabled ?
                    configuration.isPressed ?
                    Color.Primary.primary400 :
                            .Primary.primary300 :
                            .GrayScale.gray400
                )
                .cornerRadius(8)
        }
    }
}

// MARK: - Sub
extension InputButtonStyle {
    struct SubButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorScheme) private var scheme
        var isLightModel: Bool { scheme == .light }
        var body: some View {
            configuration.label
                .oriFont(
                    .body(.body3),
                    color: isEnabled ?
                        .Primary.primary300 :
                        isLightModel ?
                        .GrayScale.gray100 :
                            .GrayScale.gray700
                )
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(
                    isEnabled ?
                    configuration.isPressed ?
                    Color.Primary.primary200 :
                            .Primary.primary100 :
                            .GrayScale.gray400
                )
                .cornerRadius(8)
        }
    }
}
