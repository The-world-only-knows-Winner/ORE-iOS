import SwiftUI
import NeedleFoundation
import HomeFeatureInterface

public protocol SearchRouteDependency: Dependency {}

public final class SearchRouteComponent: Component<SearchRouteDependency>, SearchRouteFactory {
    public func makeView() -> some View {
        SearchRouteView(viewModel: .init())
    }
}
