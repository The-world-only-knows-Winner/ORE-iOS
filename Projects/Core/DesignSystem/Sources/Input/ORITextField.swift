import SwiftUI

public struct ORITextField: View {
    @Binding var text: String
    @FocusState var isFocused: Bool
    @State private var isSecure: Bool = true
    let placehoder: String
    let title: String
    let type: InputBoxType?
    @Binding var description: DescriptionType?
    let onCommit: () -> Void

    public init(
        text: Binding<String>,
        placehoder: String,
        title: String = "",
        type: InputBoxType? = nil,
        description: Binding<DescriptionType?> = .constant(nil),
        onCommit: @escaping () -> Void = {}
    ) {
        _text = text
        self.placehoder = placehoder
        self.title = title
        self.type = type
        _description = description
        self.onCommit = onCommit
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if !title.isEmpty {
                Text(title)
                    .oriFont(.body(.body4), color: .GrayScale.gray500)
            }

            HStack(spacing: 12) {
                ZStack(alignment: .leading) {
                    Text(placehoder)
                        .oriFont(.body(.body1), color: .GrayScale.gray400)
                        .opacity(text.isEmpty ? 1 : 0)

                    Group {
                        if isSecure && type == .secure {
                            SecureField("", text: $text)
                        } else {
                            TextField("", text: $text)
                        }

                    }
                    .oriFont(.body(.body1), color: .GrayScale.gray700)
                    .focused($isFocused)
                    .onSubmit(onCommit)
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
                            .onTapGesture {
                                onCommit()
                            }

                    case let .button(type):
                        InputButton(
                            text: "재전송",
                            style: type,
                            action: onCommit)

                    case .secure:
                        ORIIcon(isSecure ? .visibilityOff : .visibility)
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                isSecure.toggle()
                            }
                    }
                }
            }

            if let description {
                HStack(spacing: 4) {
                    description.descriptionIcon()
                        .frame(width: 20, height: 20)

                    Text(description.rawValue)
                        .oriFont(.body(.body3), color: .GrayScale.gray700)
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .onChange(of: self.text) { _ in
            self.description = .none
        }
        .animation(.easeIn(duration: 0.2), value: description)
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
