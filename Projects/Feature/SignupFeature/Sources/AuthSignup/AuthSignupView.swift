import DesignSystem
import SwiftUI
import SignupFeatureInterface

struct AuthSignupView: View {
    private enum FocusField {
        case email
        case authCode
        case password
    }
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: AuthSignupViewModel

    private let nextSignupFactory: any UserInfoSignupFactory

    init(
        viewModel: AuthSignupViewModel,
        userInfoSignupFactory: any UserInfoSignupFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.nextSignupFactory = userInfoSignupFactory
    }

    var body: some View {
        ZStack {
            ORINavigationBar(
                leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
                pageTitle: viewModel.signupPageText,
                scrollable: false
            ) {
                VStack(alignment: .leading, spacing: 0) {
                    if viewModel.signupStep.rawValue >= 2 {
                        ORITextField(
                            text: $viewModel.password,
                            placehoder: "사용할 비밀번호를 입력해주세요",
                            title: "비밀번호",
                            type: .secure,
                            description: $viewModel.passwordDescription
                        ) {
                            focusField = .none
                            viewModel.nextButtonDidTapped()
                        }
                        .textContentType(.password)
                        .focused($focusField, equals: .password)
                    }

                    if viewModel.signupStep.rawValue >= 1 {
                        ORITextField(
                            text: $viewModel.authCode,
                            placehoder: "XXXXXX",
                            title: "인증 코드",
                            description: $viewModel.authCodeDescription
                        ) {
                            focusField = .password
                            viewModel.nextButtonDidTapped()
                        }
                        .keyboardType(.numberPad)
                        .focused($focusField, equals: .authCode)
                    }

                    ORITextField(
                        text: $viewModel.email,
                        placehoder: "example@ex.com",
                        title: "이메일",
                        type: viewModel.emailTextFieldType,
                        description: $viewModel.emailDescription
                    ) {
                        if viewModel.signupStep == .inputEmail {
                            focusField = .authCode
                            viewModel.nextButtonDidTapped()
                        } else {
                            viewModel.sendAuthCode()
                        }
                    }
                    .keyboardType(.emailAddress)
                    .focused($focusField, equals: .email)

                    Spacer()
                }
                .transition(.slide)
                .onAppear {
                    focusField = .email
                }
                .navigate(
                    to: nextSignupFactory.makeView(
                        email: viewModel.email,
                        password: viewModel.password
                    ).eraseToAnyView(),
                    when: $viewModel.isNavigatedToUserInfoSignup)
                .hideKeyboardWhenTap()
                .animation(.easeInOut(duration: 0.2), value: viewModel.signupStep)
                .animation(.easeIn(duration: 0.2), value: viewModel.emailDescription)
                .animation(.easeIn(duration: 0.2), value: viewModel.authCodeDescription)
                .animation(.easeIn(duration: 0.2), value: viewModel.passwordDescription)
            }

            VStack {
                Spacer()

                ORIButton(text: viewModel.signupButtonText, isFocused: focusField != .none) {
                    viewModel.nextButtonDidTapped()
                }
            }
        }
    }
}
