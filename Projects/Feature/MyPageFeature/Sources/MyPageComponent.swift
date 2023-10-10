import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface
import RenewalPasswordFeatureInterface
import ChangeProfileFeatureInterface
import AuthDomainInterface
import UserDomainInterface

public protocol MyPageDependency: Dependency {
    var renewalPasswordFactory: any RenewalPasswordFactory { get }
    var changeProfileFactory: any ChangeProfileFactory { get }
    var fetchMyInfoUseCase: any FetchMyInfoUseCase { get }
    var logoutUseCase: any LogoutUseCase { get }
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageFactory {
    public func makeView() -> some View {
        MyPageView(
            viewModel: .init(
                fetchMyInfoUseCase: dependency.fetchMyInfoUseCase,
                logoutUseCase: dependency.logoutUseCase
            ),
            renewalPasswordFactory: dependency.renewalPasswordFactory,
            changeProfileFactory: dependency.changeProfileFactory
        )
    }
}
