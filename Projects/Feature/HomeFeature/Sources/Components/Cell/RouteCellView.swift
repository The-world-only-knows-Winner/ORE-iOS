import SwiftUI
import DesignSystem

struct RouteCellView: View {
    @State private var isShowingDetail = false
    @State private var isBooked = false
    @State private var isOnNotification = false
//    var qna: QnaEntity
//
//    public init(
//        qna: QnaEntity
//    ) {
//        self.qna = qna
//    }
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Text("출발")
                            .oriFont(.body(.body4), color: .GrayScale.gray500)

                        Text("경희중고")
                            .oriFont(.body(.body3), color: .GrayScale.gray600)
                    }

                    HStack(spacing: 4) {
                        Text("도착")
                            .oriFont(.body(.body4), color: .GrayScale.gray500)

                        Text("화랑대역 6번 출구")
                            .oriFont(.body(.body3), color: .GrayScale.gray600)
                    }
                }

                Spacer()

                ORIIcon(isBooked ? .star : .starOff)
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        isBooked.toggle()
                    }

                ORIIcon(isOnNotification ? .notificationsActive : .notificationsOff)
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        isOnNotification.toggle()
                    }

                ORIIcon(.expandMore)
                    .frame(width: 24, height: 24)
                    .rotationEffect(
                        isShowingDetail
                        ? Angle.degrees(180)
                        : .degrees(0)
                    )
                    .onTapGesture {
                        withAnimation {
                            isShowingDetail.toggle()
                        }
                    }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)

            if isShowingDetail {
                let range = [1, 2, 3]
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
                    RouteTimelineCellView(type: type)
                }
            }
        }
        .oriBackground()
    }
}
