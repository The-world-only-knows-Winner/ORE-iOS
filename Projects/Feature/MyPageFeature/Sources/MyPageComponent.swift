import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface
import RenewalPasswordFeatureInterface
import ChangeProfileFeatureInterface

public protocol MyPageDependency: Dependency {
    var renewalPasswordFactory: any RenewalPasswordFactory { get }
    var changeProfileFactory: any ChangeProfileFactory { get }
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageFactory {
    public func makeView() -> some View {
        MyPageView(
            viewModel: .init(),
            renewalPasswordFactory: dependency.renewalPasswordFactory,
            changeProfileFactory: dependency.changeProfileFactory
        )
    }
}
