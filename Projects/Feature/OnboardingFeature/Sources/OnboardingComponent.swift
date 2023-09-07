import SwiftUI
import UsersDomainInterface
import NeedleFoundation
import OnboardingFeatureInterface
import SigninFeatureInterface
import SignupFeatureInterface

public protocol OnboardingDependency: Dependency {
    var signinFactory: any SigninFactory { get }
    var signupFactory: any SignupFactory { get }
}

public final class OnboardingComponent: Component<OnboardingDependency>, OnboardingFactory {
    public func makeView() -> some View {
        NavigationView {
            OnboardingView(
                viewModel: .init(),
                signinFactory: dependency.signinFactory,
                signupFactory: dependency.signupFactory
            )
        }
    }
}
