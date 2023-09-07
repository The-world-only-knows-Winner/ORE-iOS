import SwiftUI

public struct ORIIcon: View {
    public enum Image {
        case accountCircle
        case arrowBack
        case expandMore
        case notificationsActive
        case notificationsOff
        case search
        case visibilityOff
        case visibility
        case xmark
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
        case .accountCircle:
            return DesignSystemAsset.Icons.accountCircle.swiftUIImage

        case .arrowBack:
            return DesignSystemAsset.Icons.arrowBack.swiftUIImage

        case .expandMore:
            return DesignSystemAsset.Icons.expandMore.swiftUIImage

        case .notificationsActive:
            return DesignSystemAsset.Icons.notificationsActive.swiftUIImage

        case .notificationsOff:
            return DesignSystemAsset.Icons.notificationsOff.swiftUIImage

        case .search:
            return DesignSystemAsset.Icons.search.swiftUIImage

        case .visibilityOff:
            return DesignSystemAsset.Icons.visibilityOff.swiftUIImage

        case .visibility:
            return DesignSystemAsset.Icons.visibility.swiftUIImage

        case .xmark:
            return DesignSystemAsset.Icons.xmark.swiftUIImage
        }
    }
}
