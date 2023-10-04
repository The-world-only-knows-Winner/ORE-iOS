import SwiftUI
import NeedleFoundation

public protocol SearchRouteDependency: Dependency {}

public final class SearchRouteComponent: Component<SearchRouteDependency> {
    public func makeView() -> some View {
        Text("Text")
    }
}

