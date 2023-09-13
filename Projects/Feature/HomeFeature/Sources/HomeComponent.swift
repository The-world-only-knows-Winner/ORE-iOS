import SwiftUI
import HomeFeatureInterface
import DesignSystem
import NeedleFoundation
import MyPageFeatureInterface

public protocol HomeDependency: Dependency {
    var myPageFactory: any MyPageFactory { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        HomeView(
            viewModel: .init(), myPageFactory: dependency.myPageFactory
        )
    }
}
