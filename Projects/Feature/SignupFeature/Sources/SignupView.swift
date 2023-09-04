import DesignSystem
import SwiftUI
import BaseFeature

struct SignupView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SignupViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Signup View")
    }
}
