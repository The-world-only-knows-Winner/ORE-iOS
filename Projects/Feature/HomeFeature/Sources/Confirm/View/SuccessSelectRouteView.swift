import SwiftUI
import DesignSystem

struct SuccessSelectRouteView: View {
    @Environment(\.rootPresentationMode) var rootPresentationMode

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            ORIIcon(.check, renderingMode: .template)
                .foregroundColor(.Primary.primary300)
                .frame(width: 128, height: 128)

            VStack(spacing: 8) {
                Text("1회 알람을 보내드릴게요!")
                    .oriFont(.heading(.heading1), color: .GrayScale.gray700)

                Group {
                    Text("만약 자주 사용한다면 별 아이콘을 통해\n경로를 즐겨찾기에 등록해보세요!")
                }
                .oriFont(.body(.body1), color: .GrayScale.gray500)
            }

            Spacer()

            ORIButton(text: "완료") {
                rootPresentationMode.wrappedValue.toggle()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
