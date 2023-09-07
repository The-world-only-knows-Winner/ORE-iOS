import SwiftUI

struct ORITextField: View {
    @Binding var text: String
    @FocusState var isFocused: Bool
    let placehoder: String
    let title: String
    let type: InputBoxType?
    let description: DescriptionType?
    let onCommit: () -> Void

    init(
        text: Binding<String>,
        placehoder: String,
        title: String,
        type: InputBoxType? = nil,
        description: DescriptionType? = nil,
        onCommit: @escaping () -> Void = {}
    ) {
        _text = text
        self.placehoder = placehoder
        self.title = title
        self.type = type
        self.description = description
        self.onCommit = onCommit
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .oriFont(.body(.body4), color: .GrayScale.gray500)

            HStack(spacing: 12) {
                ZStack(alignment: .leading) {
                    TextField("", text: $text)
                        .oriFont(.body(.body1), color: .GrayScale.gray700)
                        .focused($isFocused)
                        .onSubmit(onCommit)

                    Text(placehoder)
                        .oriFont(.body(.body1), color: .GrayScale.gray400)
                        .opacity(text.isEmpty ? 1 : 0)
                        .onTapGesture {
                            isFocused = true
                        }
                }
                .padding(.bottom, 12)
                .overlay(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke()
                        .fill(Color.GrayScale.gray400)
                        .frame(maxWidth: .infinity, maxHeight: 0.5)
                }

                if let type {
                    switch type {
                    case let .icon(image):
                        ORIIcon(image)
                            .frame(width: 24, height: 24)

                    case let .button(type):
                        InputButton(
                            text: "인증하기",
                            style: type,
                            action: onCommit)
                    }
                }
            }

            if let description {
                HStack(spacing: 4) {
                    Group {
                        switch description {
                        case .success:
                            ORIIcon(.check)

                        case .fail, .isEmpty:
                            ORIIcon(.error)
                        }
                    }
                    .frame(width: 20, height: 20)

                    Text(description.rawValue)
                        .oriFont(.body(.body3), color: .GrayScale.gray700)
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
    }
}

struct ORITextField_Previews: PreviewProvider {
    static var previews: some View {
        ORITextField(
            text: .constant("asdsf"),
            placehoder: "placeholder",
            title: "title"
        )
    }
}

enum InputBoxType {
    case button(InputButtonType)
    case icon(ORIIcon.Image)
}

enum DescriptionType: String {
    case success = "인증 메일이 발송되었어요."
    case fail = "이미 가입되있는 이메일이에요."
    case isEmpty = "내용을 입력해주세요."
}
