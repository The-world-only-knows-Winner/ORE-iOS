import DesignSystem
import SwiftUI
import UtilityModule

struct UserInfoSignupView: View {
    private enum FocusField {
        case name
        case dateBirth
    }
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: UserInfoSignupViewModel

    init(
        viewModel: UserInfoSignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            ORINavigationBar(
                leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
                pageTitle: viewModel.signupPageText
            ) {
                VStack(alignment: .leading, spacing: 0) {
                    if viewModel.signupStep.rawValue >= 1 {
                        ORIDateField(
                            date: $viewModel.dateBirth,
                            isShowDatePicker: $viewModel.isShowDatePicker,
                            title: "생년월일"
                        )
                        .focused($focusField, equals: .dateBirth)
                    }

                    ORITextField(
                        text: $viewModel.name,
                        placehoder: "홍길동",
                        title: "이름"
                    ) {
                        viewModel.nextButtonDidTapped()
                    }
                    .keyboardType(.namePhonePad)
                    .focused($focusField, equals: .name)

                    Spacer()
                }
                .transition(.slide)
                .onAppear {
                    focusField = .name
                }
                .onChange(of: focusField) {
                    if $0 == .name {
                        viewModel.isShowDatePicker = false
                    }
                }
                .onChange(of: viewModel.isShowDatePicker) {
                    if $0 {
                        hideKeyboard()
                    }
                }
                .hideKeyboardWhenTap()
                .navigate(
                    to: SuccessSignupView(name: viewModel.name),
                    when: $viewModel.isSuccessSignup
                )
                .animation(.easeIn(duration: 0.2), value: viewModel.nameDescription)
                .animation(.easeInOut(duration: 0.2), value: viewModel.signupStep)
            }

            VStack {
                Spacer()

                ORIButton(text: viewModel.signupButtonText, isFocused: focusField != .none) {
                    withAnimation {
                        viewModel.nextButtonDidTapped()
                    }
                }
            }
        }
    }
}
