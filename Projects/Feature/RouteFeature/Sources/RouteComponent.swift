import SwiftUI
import NeedleFoundation
import RouteFeatureInterface

public protocol RouteDependency: Dependency {}

public final class RouteComponent: Component<RouteDependency>, RouteFactory {
    public func makeView() -> some View {
        RouteView(viewModel: .init())
    }
}
