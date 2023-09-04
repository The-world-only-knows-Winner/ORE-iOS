import RootFeatureInterface
import NeedleFoundation
import SwiftUI
import OnboardingFeatureInterface
import SplashFeatureInterface
import HomeFeatureInterface

public protocol RootDependency: Dependency {
    var onboardingFactory: any OnboardingFactory { get }
    var homeFactory: any HomeFactory { get }
    var splashFactory: any SplashFactory { get }
}

public final class RootComponent: Component<RootDependency>, RootFactory {
    public func makeView() -> some View {
        RootView(
            onboardingFactory: dependency.onboardingFactory,
            homeFactory: dependency.homeFactory,
            splashFactory: dependency.splashFactory
        )
    }
}
