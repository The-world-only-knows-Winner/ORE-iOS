import DesignSystem
import SwiftUI
import UtilityModule

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    init(
        viewModel: HomeViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Home View")
    }
}
