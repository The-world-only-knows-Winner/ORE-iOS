import SwiftUI
import BaseFeature
import DesignSystem

struct SuccessLogoutView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            ORIIcon(.logout)
                .frame(width: 128, height: 128)

            VStack(spacing: 0) {
                Text("함께해서 즐거웠어요!")
                    .oriFont(.heading(.heading1), color: .GrayScale.gray700)

                Text("다음에 다시 봐요!")
                    .oriFont(.heading(.heading1), color: .GrayScale.gray700)
            }

            Spacer()

            ORIButton(text: "처음 화면으로 돌아가기") {
                appState.sceneFlow = .onboarding
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
