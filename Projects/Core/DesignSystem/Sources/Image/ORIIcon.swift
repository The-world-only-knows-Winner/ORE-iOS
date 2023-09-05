import SwiftUI

public struct ORIIcon: View {
    public enum Image {
        case annotation
        case arrowBack
        case bellOff
        case bellOn
        case busIcon
        case eyeClose
        case eyeOpen
        case magnifyingglass
        case personCircle
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
        oriIconToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    public func oriIconToImage() -> SwiftUI.Image {
        switch image {
        case .annotation:
            return DesignSystemAsset.Icons.annotation.swiftUIImage

        case .arrowBack:
            return DesignSystemAsset.Icons.arrowBack.swiftUIImage

        case .bellOff:
            return DesignSystemAsset.Icons.bellOff.swiftUIImage

        case .bellOn:
            return DesignSystemAsset.Icons.bellOn.swiftUIImage

        case .busIcon:
            return DesignSystemAsset.Icons.busIcon.swiftUIImage

        case .eyeClose:
            return DesignSystemAsset.Icons.eyeClose.swiftUIImage

        case .eyeOpen:
            return DesignSystemAsset.Icons.eyeOpen.swiftUIImage

        case .magnifyingglass:
            return DesignSystemAsset.Icons.magnifyingglass.swiftUIImage

        case .personCircle:
            return DesignSystemAsset.Icons.personCircle.swiftUIImage
        }
    }
}
