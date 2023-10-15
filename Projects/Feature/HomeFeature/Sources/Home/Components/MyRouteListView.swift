import SwiftUI
import RouteDomainInterface
import DesignSystem

struct MyRouteListView: View {
    let myRouteList: [MyRouteListEntity]

    init(myRouteList: [MyRouteListEntity]) {
        self.myRouteList = myRouteList
    }

    var body: some View {
        if myRouteList.isEmpty {
            EmptyRouteView(
                title: "현재 즐겨찾기에 등록된 경로가 없어요",
                content: "전체에서 자주 사용하는 경로를 즐겨찾기 해주세요!"
            )
        } else {
            ScrollView {
                VStack(spacing: 1) {
                    ForEach(myRouteList, id: \.self) { myRoute in
                        RouteCellView(startName: myRoute.startName, endName: myRoute.endName)
                    }
                }
            }
            .background(Color.GrayScale.gray200)
        }
    }
}
