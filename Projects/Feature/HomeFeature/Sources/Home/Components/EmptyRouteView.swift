import SwiftUI
import DesignSystem

struct EmptyRouteView: View {
    let title: String
    let content: String
    let action: (() -> Void)?

    init(title: String, content: String, action: (() -> Void)? = nil) {
        self.title = title
        self.content = content
        self.action = action
    }

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                VStack(spacing: 16) {
                    ORIImage(.emptyOri)
                        .frame(width: 128, height: 192.5)

                    VStack(spacing: 4) {
                        Text(title)
                            .oriFont(.heading(.heading2), color: .GrayScale.gray700)

                        Text(content)
                            .oriFont(.body(.body1), color: .GrayScale.gray500)
                    }
                }
                .padding(.vertical, 16)

                if let action {
                    ORIButton(text: "등록하러 가기", action: action)
                }
            }
            .padding(.vertical, 128)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
