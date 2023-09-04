import SwiftUI
import UsersDomainInterface
import NeedleFoundation
import OnboardingFeatureInterface
import SigninFeatureInterface
import SignupFeatureInterface

public protocol OnboardingDependency: Dependency {
}

public final class OnboardingComponent: Component<OnboardingDependency>, OnboardingFactory {
    public func makeView() -> some View {
        OnboardingView(
            viewModel: .init()
        )
    }
}
