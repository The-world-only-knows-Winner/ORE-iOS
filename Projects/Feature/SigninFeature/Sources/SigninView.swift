import DesignSystem
import SwiftUI
import BaseFeature

struct SigninView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SigninViewModel

    init(
        viewModel: SigninViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Signin View")
    }
}
