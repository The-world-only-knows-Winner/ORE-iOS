import SignupFeatureInterface
import SwiftUI
import AuthDomainInterface
import NeedleFoundation

public protocol AuthSignupDependency: Dependency {
    var userInfoSignupFactory: any UserInfoSignupFactory { get }
}

public final class AuthSignupComponent: Component<AuthSignupDependency>, AuthSignupFactory {
    public func makeView() -> some View {
        AuthSignupView(
            viewModel: .init(),
            userInfoSignupFactory: dependency.userInfoSignupFactory
        )
    }
}
