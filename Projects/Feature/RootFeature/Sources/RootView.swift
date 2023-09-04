import BaseFeature
import SwiftUI
import SplashFeatureInterface
import OnboardingFeatureInterface
import HomeFeatureInterface

struct RootView: View {
    @EnvironmentObject var appState: AppState
    private let onboardingFactory: any OnboardingFactory
    private let homeFactory: any HomeFactory
    private let splashFactory: any SplashFactory

    public init(
        onboardingFactory: any OnboardingFactory,
        homeFactory: any HomeFactory,
        splashFactory: any SplashFactory
    ) {
        self.onboardingFactory = onboardingFactory
        self.homeFactory = homeFactory
        self.splashFactory = splashFactory
    }

    var body: some View {
        ZStack {
            switch appState.sceneFlow {
            case .onboarding:
                onboardingFactory.makeView().eraseToAnyView()
                    .environmentObject(appState)

            case .home:
                homeFactory.makeView().eraseToAnyView()
                    .environmentObject(appState)

            case .splash:
                splashFactory.makeView().eraseToAnyView()
                    .environmentObject(appState)
            }
        }
        .animation(.easeInOut, value: appState.sceneFlow)
        .transition(.opacity.animation(.easeInOut))
    }
}
