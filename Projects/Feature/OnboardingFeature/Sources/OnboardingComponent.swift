import SwiftUI
import NeedleFoundation
import OnboardingFeatureInterface

public protocol OnboardingDependency: Dependency {}

public final class OnboardingComponent: Component<OnboardingDependency>, OnboardingFactory {
    public func makeView() -> some View {
        Text("Text")
    }
}
