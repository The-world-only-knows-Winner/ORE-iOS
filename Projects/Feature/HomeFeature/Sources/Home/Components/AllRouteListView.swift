import SwiftUI
import DesignSystem

struct AllRoutedListView: View {
    let list: [Int]

    var body: some View {
        if list.isEmpty {
            EmptyRouteView(
                title: "현재 오리에 등록된 경로가 없어요",
                content: "아래 버튼을 통해 경로를 등록해주세요!"
            ) {
                print("등록하러가기!")
            }
        } else {
            ScrollView {
                VStack(spacing: 1) {
                    ForEach(list, id: \.self) { _ in
                        RouteCellView()
                    }
                }
            }
            .background(Color.GrayScale.gray200)
        }
    }
}
