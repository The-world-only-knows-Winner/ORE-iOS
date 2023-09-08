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
        VStack(alignment: .leading, spacing: 0) {
            if viewModel.signupStep.rawValue >= 2 {
                ORITextField(
                    text: $viewModel.password,
                    placehoder: "비밀번호을 입력해주세요",
                    title: "비밀번호",
                    type: .secure
                ) {
                    viewModel.nextButtonDidTapped()
                }
                .textContentType(.password)
                .focused($focusField, equals: .password)
            }

            if viewModel.signupStep.rawValue >= 1 {
                ORITextField(
                    text: $viewModel.authCode,
                    placehoder: "인증코드를 입력해주세요",
                    title: "인증 코드"
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
                description: viewModel.emailDescription
            ) {
                focusField = .authCode
                viewModel.nextButtonDidTapped()
            }
            .keyboardType(.emailAddress)
            .focused($focusField, equals: .email)

            Spacer()

            ORIButton(text: viewModel.signupButtonText, isFocused: focusField != .none) {
                viewModel.nextButtonDidTapped()
            }
        }
        .transition(.slide)
        .animation(.easeInOut(duration: 0.3), value: viewModel.signupStep)
        .onAppear {
            focusField = .email
        }
        .navigate(to: nextSignupFactory.makeView().eraseToAnyView(), when: $viewModel.isNavigatedToUserInfoSignup)
        .hideKeyboardWhenTap()
        .oriNavigationBar(
            leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
            pageTitle: viewModel.signupPageText
        )
    }
}
