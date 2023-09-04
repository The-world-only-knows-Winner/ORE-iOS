import DesignSystem
import SwiftUI
import BaseFeature

struct OnboardingView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: OnboardingViewModel

    init(
        viewModel: OnboardingViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Onboarding View")
    }
}
