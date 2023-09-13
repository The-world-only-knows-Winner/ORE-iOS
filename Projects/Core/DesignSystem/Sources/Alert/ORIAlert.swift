import SwiftUI

public extension View {
    func oriAlert(
        isPresented: Binding<Bool>,
        type: ORIAlertType,
        action: @escaping () -> Void
    ) -> some View {
        self.fullScreenCover(isPresented: isPresented) {
            ORIAlert(
                type: type,
                action: action
            )
        }
    }
}

public struct ORIAlert: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var animate = false
    var type: ORIAlertType
    var action: () -> Void

    public init(
        type: ORIAlertType,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.action = action
    }

    public var body: some View {
        ZStack {
            Color.black.opacity(0.7).ignoresSafeArea()
                .opacity(animate ? 1.0 : 0.0)
                .onTapGesture {
                    self.dismissAlert()
                }

            VStack(
                alignment: .leading,
                spacing: 24
            ) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(type.title)
                        .oriFont(.heading(.heading2), color: .GrayScale.gray700)
                        .padding(.bottom, 4)

                    ForEach(type.contents, id: \.self) { content in
                        Text(content)
                            .oriFont(.body(.body1), color: .GrayScale.gray500)
                    }
                }

                HStack(spacing: 8) {
                    alertButton(
                        "취소",
                        foregroundColor: type.cancelColor.foregroundColor,
                        backgroundColor: type.cancelColor.backgroundColor
                    ) { }

                    alertButton(
                        type.rawValue,
                        foregroundColor: type.okColor.foregroundColor,
                        backgroundColor: type.okColor.backgroundColor
                    ) {
                        action()
                    }
                }
            }
            .padding(20)
            .background(Color.GrayScale.gray100)
            .cornerRadius(16)
            .padding(20)
        }
        .onAppear {
            withAnimation(.default.speed(0.3)) {
                animate = true
            }
        }
        .background(Background())
    }

    private func dismissAlert() {
        withAnimation(.default.speed(0.3)) {
            animate = false
            self.presentationMode.wrappedValue.dismiss()
        }
    }

    @ViewBuilder
    func alertButton(
        _ text: String,
        foregroundColor: Color,
        backgroundColor: Color,
        action: @escaping () -> Void
    ) -> some View {
        Button {
            action()
            dismissAlert()
        } label: {
            Text(text)
                .oriFont(.body(.body1), color: foregroundColor)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(12)
        }
    }
}
