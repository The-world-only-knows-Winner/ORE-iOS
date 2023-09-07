import SwiftUI

public struct ORIImage: View {
    public enum Image: Hashable {
        case oriIcon
        case onboarding1
        case onboarding2
        case onboarding3
        case onboarding4
    }

    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        oriToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    private func oriToImage() -> SwiftUI.Image {
        switch image {
        case .oriIcon:
            return DesignSystemAsset.Image.oriIcon.swiftUIImage

        case .onboarding1:
            return DesignSystemAsset.Image.onboarding1.swiftUIImage

        case .onboarding2:
            return DesignSystemAsset.Image.onboarding2.swiftUIImage

        case .onboarding3:
            return DesignSystemAsset.Image.onboarding3.swiftUIImage

        case .onboarding4:
            return DesignSystemAsset.Image.onboarding4.swiftUIImage
        }
    }
}
