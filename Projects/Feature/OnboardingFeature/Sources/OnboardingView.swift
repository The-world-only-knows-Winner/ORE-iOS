import DesignSystem
import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel

    init(
        viewModel: OnboardingViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
