import SwiftUI
import HomeFeatureInterface
import DesignSystem

struct SetAlarmView: View {
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
                pageTitle: "원하는 경로를 선택해주세요",
                scrollable: true
            ) {
                VStack(spacing: 0) {
                    HStack(spacing: 16) {
                        location("대덕소프트웨어마이스터고등학교", type: .start)

                        ORIIcon(.arrowForward)
                            .frame(width: 24, height: 24)

                        location("부산소프트웨어마이스터고등학교", type: .end)
                    }

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
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("n분 전 알림")
                                            .oriFont(.body(.body1), color: .GrayScale.gray700)

                                        Text("수정하기")
                                            .oriFont(.body(.body3), color: .Primary.primary300)
                                    }
                                    .padding(.vertical, 20)
                                    .padding(.trailing, 27)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }

            ORIButton(text: "선택 완료") {
                viewModel.isNavigatedToConfirmRoute.toggle()
            }
        }
        .navigate(
            to: ConfirmRouteView(viewModel: viewModel)
                .environment(\.rootPresentationMode, rootPresentationMode),
            when: $viewModel.isNavigatedToConfirmRoute
        )
    }

    @ViewBuilder
    func location(_ text: String, type: LocationType) -> some View {
        HStack(spacing: 4) {
            Group {
                switch type {
                case .start:
                    ORIIcon(.startPosition)
                case .end:
                    ORIIcon(.endPosition)
                }
            }
            .frame(width: 24, height: 24)

            Text(text)
                .oriFont(.body(.body1), color: .GrayScale.gray700)

            Spacer()
        }
    }
}
