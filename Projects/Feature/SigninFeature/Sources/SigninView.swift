import DesignSystem
import SwiftUI
import BaseFeature

struct SigninView: View {
    private enum FocusField {
        case email
        case password
    }
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SigninViewModel

    init(
        viewModel: SigninViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ORITextField(
                text: $viewModel.email,
                placehoder: "example@ex.com",
                title: "이메일",
                description: viewModel.emailDescription
            ) {
                focusField = .password
            }
            .keyboardType(.emailAddress)
            .focused($focusField, equals: .email)

            ORITextField(
                text: $viewModel.password,
                placehoder: "비밀번호을 입력해주세요",
                title: "비밀번호",
                type: .secure
            ) {
                // login!
            }
            .textContentType(.password)
            .focused($focusField, equals: .password)

            Spacer()

            ORIButton(text: "시작하기", isFocused: focusField != .none) {
                // login
            }
        }
        .onAppear {
            focusField = .email
        }
        .hideKeyboardWhenTap()
        .oriNavigationBar(
            leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
            pageTitle: "다시 오신걸 환영해요!"
        )
    }
}
