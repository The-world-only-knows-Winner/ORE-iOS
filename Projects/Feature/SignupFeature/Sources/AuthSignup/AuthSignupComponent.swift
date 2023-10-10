import SignupFeatureInterface
import SwiftUI
import AuthDomainInterface
import NeedleFoundation

public protocol AuthSignupDependency: Dependency {
    var userInfoSignupFactory: any UserInfoSignupFactory { get }
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
}

public final class AuthSignupComponent: Component<AuthSignupDependency>, AuthSignupFactory {
    public func makeView() -> some View {
        AuthSignupView(
            viewModel: .init(
                sendAuthCodeUseCase: dependency.sendAuthCodeUseCase,
                verifyAuthCodeUseCase: dependency.verifyAuthCodeUseCase
            ),
            userInfoSignupFactory: dependency.userInfoSignupFactory
        )
    }
}
