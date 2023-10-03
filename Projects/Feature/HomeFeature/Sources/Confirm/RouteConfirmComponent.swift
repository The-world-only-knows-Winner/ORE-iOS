import SwiftUI
import NeedleFoundation
import HomeFeatureInterface

public protocol RouteConfirmDependency: Dependency {}

public final class RouteConfirmComponent: Component<RouteConfirmDependency>, RouteConfirmFactory {
    public func makeView() -> some View {
        RouteConfirmView(viewModel: .init())
    }
}

