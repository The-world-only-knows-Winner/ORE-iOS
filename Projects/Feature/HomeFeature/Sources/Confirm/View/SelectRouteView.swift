import DesignSystem
import HomeFeatureInterface
import SwiftUI

struct SelectRouteView: View {
    @StateObject var viewModel: ConfirmViewModel
    @Environment(\.rootPresentationMode) var rootPresentationMode
    @Environment(\.dismiss) private var dismiss

    let values: [Int] = Array(0..<20)

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
                ForEach(values, id: \.self) { value in
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

                            TimelineCellView(type: type)
                                .oriBackground()
                                .onTapGesture {
                                    viewModel.isNavigatedToSetAlarm.toggle()
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                    .overlay(alignment: .top) {
                        if value != values.first {
                            Color.GrayScale.gray200
                                .frame(maxWidth: .infinity, maxHeight: 1)
                        }
                    }
                }
            }
        }
        .navigate(
            to: SetAlarmView(viewModel: viewModel)
                .environment(\.rootPresentationMode, rootPresentationMode),
            when: $viewModel.isNavigatedToSetAlarm
        )
    }
}
