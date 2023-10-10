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
        ZStack {
            ORINavigationBar(
                leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
                pageTitle: "다시 오신걸 환영해요!"
            ) {
                VStack(alignment: .leading, spacing: 0) {
                    ORITextField(
                        text: $viewModel.email,
                        placehoder: "example@ex.com",
                        title: "이메일",
                        description: $viewModel.emailDescription
                    ) {
                        focusField = .password
                    }
                    .keyboardType(.emailAddress)
                    .focused($focusField, equals: .email)

                    ORITextField(
                        text: $viewModel.password,
                        placehoder: "비밀번호을 입력해주세요",
                        title: "비밀번호",
                        type: .secure,
                        description: $viewModel.passwordDescription
                    ) {
                        withAnimation(.easeIn(duration: 0.2)) {
                            viewModel.signinButtonDidTap()
                        }
                    }
                    .textContentType(.password)
                    .focused($focusField, equals: .password)

                    Spacer()
                }
                .onChange(of: viewModel.isSuccessSignin) { _ in
                    self.appState.sceneFlow = .home
                }
                .onAppear {
                    focusField = .email
                }
                .hideKeyboardWhenTap()
                .animation(.easeIn(duration: 0.2), value: viewModel.emailDescription)
                .animation(.easeIn(duration: 0.2), value: viewModel.passwordDescription)
            }

            VStack {
                Spacer()

                ORIButton(text: "시작하기", isFocused: focusField != .none) {
                    withAnimation(.easeIn(duration: 0.2)) {
                        viewModel.signinButtonDidTap()
                    }
                }
            }
        }
    }
}
