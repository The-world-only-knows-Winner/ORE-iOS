import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface
import RenewalPasswordInterface
import AuthDomainInterface

public protocol MyPageDependency: Dependency {
    var renewalPasswordFactory: any RenewalPasswordFactory { get }
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageFactory {
    public func makeView() -> some View {
        MyPageView(
            viewModel: .init(),
            renewalPasswordFactory: dependency.renewalPasswordFactory
        )
    }
}
