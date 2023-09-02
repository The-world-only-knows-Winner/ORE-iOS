import BaseFeature
import SwiftUI
import SplashFeatureInterface
import OnboardingFeatureInterface

struct RootView: View {
    @EnvironmentObject var appState: AppState
    private let onboardingFactory: any OnboardingFactory
    private let splashFactory: any SplashFactory

    public init(
        onboardingFactory: any OnboardingFactory,
        splashFactory: any SplashFactory
    ) {
        self.onboardingFactory = onboardingFactory
        self.splashFactory = splashFactory
    }

    var body: some View {
        ZStack {
            switch appState.sceneFlow {
            case .onboarding:
                onboardingFactory.makeView().eraseToAnyView()
                    .environmentObject(appState)

            case .main:
                Text("molla")

            case .splash:
                splashFactory.makeView().eraseToAnyView()
                    .environmentObject(appState)
            }
        }
        .animation(.easeInOut, value: appState.sceneFlow)
        .transition(.opacity.animation(.easeInOut))
    }
}
