import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface
import AuthDomainInterface

public protocol MyPageDependency: Dependency {
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageFactory {
    public func makeView() -> some View {
        MyPageView(
            viewModel: .init()
        )
    }
}
