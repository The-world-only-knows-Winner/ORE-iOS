import SwiftUI
import HomeFeatureInterface
import DesignSystem

struct ConfirmRouteView: View {
    @StateObject var viewModel: ConfirmViewModel
    @Environment(\.rootPresentationMode) var rootPresentationMode
    @Environment(\.dismiss) private var dismiss

    init(
        viewModel: ConfirmViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 0) {
            ORINavigationBar(
                leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
                pageTitle: "마지막으로 확인해주세요!",
                scrollable: true
            ) {
                VStack(spacing: 0) {
                    let range: [Int] = Array(0..<3)
                    ForEach(range, id: \.self) { index in
                        var type: TimelineType {
                            if range.first == index {
                                return .head
                            } else if range.last == index {
                                return .tail
                            } else {
                                return .body
                            }
                        }

                        HStack(spacing: 0) {
                            TimelineCellView(type: type)

                            if type != .tail {
                                Text("3분 전 알림")
                                    .oriFont(.body(.body1), color: .GrayScale.gray700)
                                    .frame(width: 80, alignment: .leading)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }

            ORIButton(text: "등록하기") {
                viewModel.isNavigatedToSuccessSelectRoute.toggle()
            }
        }
        .navigate(
            to: SuccessSelectRouteView()
                .environment(\.rootPresentationMode, rootPresentationMode),
            when: $viewModel.isNavigatedToSuccessSelectRoute
        )
    }
}
