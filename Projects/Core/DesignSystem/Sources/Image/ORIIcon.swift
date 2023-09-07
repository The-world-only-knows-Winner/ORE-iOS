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
        case check
        case error
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
    }

    // swiftlint: disable all
    @ViewBuilder
    public func oriIconToImage() -> some View {
        switch image {
        case .accountCircle:
            DesignSystemAsset.Icons.accountCircle.swiftUIImage
                .imageColorSet(color: .GrayScale.gray400)

        case .arrowBack:
            DesignSystemAsset.Icons.arrowBack.swiftUIImage
                .imageColorSet(color: .GrayScale.gray400)

        case .expandMore:
            DesignSystemAsset.Icons.expandMore.swiftUIImage
                .imageColorSet(color: .GrayScale.gray700)

        case .notificationsActive:
            DesignSystemAsset.Icons.notificationsActive.swiftUIImage
                .imageColorSet(color: .Primary.primary300)

        case .notificationsOff:
            DesignSystemAsset.Icons.notificationsOff.swiftUIImage
                .imageColorSet(color: .GrayScale.gray400)

        case .search:
            DesignSystemAsset.Icons.search.swiftUIImage
                .imageColorSet(color: .GrayScale.gray400)

        case .visibilityOff:
            DesignSystemAsset.Icons.visibilityOff.swiftUIImage
                .imageColorSet(color: .GrayScale.gray700)

        case .visibility:
            DesignSystemAsset.Icons.visibility.swiftUIImage
                .imageColorSet(color: .GrayScale.gray700)

        case .xmark:
            DesignSystemAsset.Icons.xmark.swiftUIImage
                .imageColorSet(color: .GrayScale.gray700)

        case .check:
            DesignSystemAsset.Icons.check.swiftUIImage
                .imageColorSet(color: .State.green)

        case .error:
            DesignSystemAsset.Icons.error.swiftUIImage
                .imageColorSet(color: .State.red)
        }
    }
}

private extension SwiftUI.Image {
    @ViewBuilder
    func imageColorSet(color: Color) -> some View {
        self
            .resizable()
            .renderingMode(.template)
            .foregroundColor(color)
    }
}
