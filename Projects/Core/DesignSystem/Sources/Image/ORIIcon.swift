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
        case receiptLong
        case lock
        case logout
        case star
        case starOff
        case distance
        case directionsBus
        case add
        case arrowForward
        case myLocation
        case startPositionOff
        case startPosition
        case endPositionOff
        case endPosition
        case startPin
        case endPin
        case myPin
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
                .resizable()
                .renderingMode(renderingMode)

        case .error:
            DesignSystemAsset.Icons.error.swiftUIImage
                .imageColorSet(color: .State.red)

        case .receiptLong:
            DesignSystemAsset.Icons.receiptLong.swiftUIImage
                .imageColorSet(color: .GrayScale.gray700)

        case .lock:
            DesignSystemAsset.Icons.lock.swiftUIImage
                .imageColorSet(color: .GrayScale.gray700)

        case .logout:
            DesignSystemAsset.Icons.logout.swiftUIImage
                .imageColorSet(color: .GrayScale.gray700)

        case .star:
            DesignSystemAsset.Icons.star.swiftUIImage
                .imageColorSet(color: .Primary.primary300)

        case .starOff:
            DesignSystemAsset.Icons.starOff.swiftUIImage
                .imageColorSet(color: .GrayScale.gray400)

        case .distance:
            DesignSystemAsset.Icons.distance.swiftUIImage
                .imageColorSet(color: .GrayScale.gray700)

        case .directionsBus:
            DesignSystemAsset.Icons.directionsBus.swiftUIImage
                .imageColorSet(color: .GrayScale.gray600)

        case .add:
            DesignSystemAsset.Icons.add.swiftUIImage
                .imageColorSet(color: .white)

        case .arrowForward:
            DesignSystemAsset.Icons.arrowForward.swiftUIImage
                .imageColorSet(color: .GrayScale.gray500)

        case .myLocation:
            DesignSystemAsset.Icons.myLocation.swiftUIImage
                .imageColorSet(color: .GrayScale.gray700)

        case .startPositionOff:
            DesignSystemAsset.Icons.startPositionOff.swiftUIImage
                .imageColorSet(color: .GrayScale.gray400)

        case .startPosition:
            DesignSystemAsset.Icons.startPosition.swiftUIImage
                .imageColorSet(color: .Primary.primary300)

        case .endPositionOff:
            DesignSystemAsset.Icons.endPositionOff.swiftUIImage
                .imageColorSet(color: .GrayScale.gray400)

        case .endPosition:
            DesignSystemAsset.Icons.endPosition.swiftUIImage
                .imageColorSet(color: .Primary.primary300)

        case .startPin:
            DesignSystemAsset.Icons.startPin.swiftUIImage
                .resizable()
                .renderingMode(renderingMode)

        case .endPin:
            DesignSystemAsset.Icons.endPin.swiftUIImage
                .resizable()
                .renderingMode(renderingMode)

        case .myPin:
            DesignSystemAsset.Icons.myPin.swiftUIImage
                .resizable()
                .renderingMode(renderingMode)
        }
    }
    // swiftlint: enable all
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
