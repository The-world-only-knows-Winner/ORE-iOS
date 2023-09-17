import DesignSystem
import MyPageFeatureInterface
import SwiftUI
import UtilityModule

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    private let myPageFactory: any MyPageFactory

    init(
        viewModel: HomeViewModel,
        myPageFactory: any MyPageFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.myPageFactory = myPageFactory
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("home view")
            }
            .navigate(
                to: myPageFactory.makeView().eraseToAnyView(),
                when: $viewModel.isNavigatedToMyPage
            )
            .oriNavigationBar(
                trailingItem: .init(image: .init(.accountCircle)) {
                    self.viewModel.isNavigatedToMyPage.toggle()
                }
            )
        }
    }
}
