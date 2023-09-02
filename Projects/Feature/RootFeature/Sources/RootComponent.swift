import RootFeatureInterface
import NeedleFoundation
import SwiftUI
import OnboardingFeatureInterface
import SplashFeatureInterface

public protocol RootDependency: Dependency {
    var onboardingFactory: any OnboardingFactory { get }
    var splashFactory: any SplashFactory { get }
}

public final class RootComponent: Component<RootDependency>, RootFactory {
    public func makeView() -> some View {
        RootView(
            onboardingFactory: dependency.onboardingFactory,
            splashFactory: dependency.splashFactory
        )
    }
}
