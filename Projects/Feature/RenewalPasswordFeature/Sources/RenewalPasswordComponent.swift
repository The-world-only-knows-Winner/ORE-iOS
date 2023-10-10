import SwiftUI
import NeedleFoundation
import RenewalPasswordFeatureInterface
import AuthDomainInterface

public protocol RenewalPasswordDependency: Dependency {
    var changePasswordUseCase: any ChangePasswordUseCase { get }
}

public final class RenewalPasswordComponent: Component<RenewalPasswordDependency>, RenewalPasswordFactory {
    public func makeView() -> some View {
        RenewalPasswordView(viewModel: .init(changePasswordUseCase: dependency.changePasswordUseCase))
    }
}
