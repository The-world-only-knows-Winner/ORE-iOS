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
        let views: [any View] = [
            AllRoutedListView(list: viewModel.allRouteList)
                .addRouteButton {
                    viewModel.isNavigatedToRoute.toggle()
                },
            StarRouteListView(list: viewModel.starRouteList)
                .addRouteButton {
                    viewModel.isNavigatedToRoute.toggle()
                }
        ]

        VStack(spacing: 0) {
            SegmentPageView(
                items: ["전체", "즐겨찾기"],
                selection: $viewModel.segmentSelection
            )

            TabView(selection: $viewModel.segmentSelection) {
                ForEach(0..<views.count, id: \.self) { index in
                    views[index].eraseToAnyView()
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            Spacer()
        }
        .ignoresSafeArea(edges: .bottom)
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

extension View {
    func addRouteButton(action: @escaping () -> Void) -> some View {
        ZStack(alignment: .bottomTrailing) {
            self

            Button(action: action) {
                ORIIcon(.add)
                    .frame(width: 36, height: 36)
                    .padding(8)
                    .background(Color.Primary.primary300)
                    .clipShape(Circle())
                    .shadow(color: .black, opacity: 0.1, blur: 16)
                    .padding(.trailing, 20)
                    .padding(.bottom, 24)
            }
        }
    }
}
