import SwiftUI
import NeedleFoundation
import SignupFeatureInterface
import UserDomainInterface

public protocol UserInfoSignupDependency: Dependency {
    var signupUseCase: any SignupUseCase { get }
}

public final class UserInfoSignupComponent: Component<UserInfoSignupDependency>, UserInfoSignupFactory {
    public func makeView(email: String, password: String) -> some View {
        UserInfoSignupView(
            viewModel: .init(
                signupUseCase: dependency.signupUseCase,
                email: email,
                password: password
            )
        )
    }
}
