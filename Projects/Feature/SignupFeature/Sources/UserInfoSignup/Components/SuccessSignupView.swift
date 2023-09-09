import SwiftUI
import DesignSystem
import UtilityModule
import BaseFeature

struct SuccessSignupView: View {
    @EnvironmentObject var appState: AppState
    let name: String

    init(name: String) {
        self.name = name
    }

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            ORIIcon(.check, renderingMode: .template)
                .foregroundColor(.Primary.primary300)
                .frame(width: 128, height: 128)

            Group {
                Text("오신것을 환영해요")
                Text(name + "님!")
            }
            .oriFont(.heading(.heading1), color: .GrayScale.gray700)

            Spacer()

            ORIButton(text: "다음") {
                appState.sceneFlow = .home
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
