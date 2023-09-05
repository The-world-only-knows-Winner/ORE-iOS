import DesignSystem
import MyPageFeatureInterface
import SwiftUI
import UtilityModule
import Kingfisher
import BaseFeature

struct MyPageView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: MyPageViewModel

    init(
        viewModel: MyPageViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("MyPage View")
    }
}
