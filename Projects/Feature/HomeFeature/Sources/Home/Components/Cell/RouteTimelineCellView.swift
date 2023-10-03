import SwiftUI
import DesignSystem
import HomeFeatureInterface

struct RouteTimelineCellView: View {
    let type: TimelineType

    init(type: TimelineType) { self.type = type }

    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.Primary.primary300)
                    .frame(width: 2, height: type.topHeight)
                    .opacity(type == .head ? 0 : 1)

                Circle()
                    .fill(Color.GrayScale.gray100)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 2)
                            .fill(Color.Primary.primary300)
                    }
                    .frame(width: 20, height: 20)

                Rectangle()
                    .fill(Color.Primary.primary300)
                    .frame(width: 2, height: type.bottomHeight)
                    .opacity(type == .tail ? 0 : 1)
            }

            HStack(spacing: 8) {
                ORIIcon(type == .tail ? .distance : .directionsBus)
                    .frame(width: 32, height: 32)

                VStack(alignment: .leading, spacing: 4) {
                    Text("대전역")
                        .oriFont(.body(.body1), color: .GrayScale.gray700)

                    Text(type == .tail ? "도착" : "706")
                        .oriFont(.body(.body3), color: .GrayScale.gray500)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 12)

            Spacer()
        }
        .padding(.horizontal, 20)
    }
}
