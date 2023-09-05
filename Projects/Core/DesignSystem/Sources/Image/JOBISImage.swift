import SwiftUI

public struct ORIImage: View {
    public enum Image {
        case oriIcon
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
        jobisToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    private func jobisToImage() -> SwiftUI.Image {
        switch image {
        case .oriIcon:
            return DesignSystemAsset.Image.oriIcon.swiftUIImage
        }
    }
}
