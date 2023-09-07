import SwiftUI

public struct ORIButtonStyle: ButtonStyle {
    var style: ORIButtonType

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .default:
            DefaultButton(configuration: configuration)
        case .sub:
            SubButton(configuration: configuration)
        }
    }
}

// MARK: - Usage
extension Button {
    func oriButtonStyle(_ style: ORIButtonType) -> some View {
        self.buttonStyle(ORIButtonStyle(style: style))
    }
}

// MARK: - Default
extension ORIButtonStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorScheme) private var scheme
        var isLightModel: Bool { scheme == .light }
        var body: some View {
            configuration.label
                .oriFont(
                    .body(.body1),
                    color: isLightModel ?
                        .GrayScale.gray100 :
                            .GrayScale.gray700
                )
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(
                    isEnabled ?
                    configuration.isPressed ?
                    Color.Primary.primary400 :
                            .Primary.primary300 :
                            .GrayScale.gray400
                )
        }
    }
}

// MARK: - Sub
extension ORIButtonStyle {
    struct SubButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorScheme) private var scheme
        var isLightModel: Bool { scheme == .light }
        var body: some View {
            configuration.label
                .oriFont(
                    .body(.body1),
                    color: isEnabled ?
                        .Primary.primary300 :
                        isLightModel ?
                        .GrayScale.gray100 :
                            .GrayScale.gray700
                )
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(
                    isEnabled ?
                    configuration.isPressed ?
                    Color.Primary.primary200 :
                            .Primary.primary100 :
                            .GrayScale.gray400
                )
                .cornerRadius(12)
        }
    }
}
