import SwiftUI
import NeedleFoundation
import HomeFeatureInterface

public protocol RouteDependency: Dependency {
    var confirmFactory: any ConfirmFactory { get }
}

public final class RouteComponent: Component<RouteDependency>, RouteFactory {
    public func makeView() -> some View {
        RouteView(
            viewModel: .init(),
            confirmFactory: dependency.confirmFactory
        )
    }
}
