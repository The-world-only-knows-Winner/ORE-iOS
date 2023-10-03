import SwiftUI
import DesignSystem

struct StarRouteListView: View {
    let list: [Int]

    var body: some View {
        if list.isEmpty {
            EmptyRouteView(
                title: "현재 즐겨찾기에 등록된 경로가 없어요",
                content: "전체에서 자주 사용하는 경로를 즐겨찾기 해주세요!"
            )
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
