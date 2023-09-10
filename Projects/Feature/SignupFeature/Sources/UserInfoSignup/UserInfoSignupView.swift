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
                placehoder: "이름을 입력해주세요.",
                title: "이름"
            ) {
                focusField = .dateBirth
                viewModel.nextButtonDidTapped()
            }
            .keyboardType(.namePhonePad)
            .focused($focusField, equals: .name)

            Spacer()

            ORIButton(text: viewModel.signupButtonText, isFocused: focusField != .none) {
                withAnimation {
                    viewModel.nextButtonDidTapped()
                }
            }
        }
        .transition(.slide)
        .animation(.easeInOut(duration: 0.3), value: viewModel.signupStep)
        .onAppear {
            focusField = .name
        }
        .onChange(of: focusField) {
            if $0 == .name {
                withAnimation {
                    viewModel.isShowDatePicker = false
                }
            }
        }
        .hideKeyboardWhenTap()
        .oriNavigationBar(
            leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
            pageTitle: viewModel.signupPageText
        )
        .navigate(
            to: SuccessSignupView(name: viewModel.name),
            when: $viewModel.isSuccessSignup
        )
    }
}
