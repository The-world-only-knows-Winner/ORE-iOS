import SwiftUI
import NeedleFoundation
import ChangeProfileFeatureInterface
import UserDomainInterface

public protocol ChangeProfileDependency: Dependency {
    var updateMyInfoUseCase: any UpdateMyInfoUseCase { get }
}

public final class ChangeProfileComponent: Component<ChangeProfileDependency>, ChangeProfileFactory {
    public func makeView(name: String, birthday: String) -> some View {
        ChangeProfileView(
            viewModel: .init(
                updateMyInfoUseCase: dependency.updateMyInfoUseCase,
                name: name,
                birthday: birthday
            )
        )
    }
}
