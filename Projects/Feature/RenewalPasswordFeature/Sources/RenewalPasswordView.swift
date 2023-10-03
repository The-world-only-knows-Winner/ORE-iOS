import DesignSystem
import SwiftUI
import BaseFeature

struct RenewalPasswordView: View {
    private enum FocusField {
        case oldPassword
        case newPassword
    }
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: RenewalPasswordViewModel

    init(
        viewModel: RenewalPasswordViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ORINavigationBar(
            leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
            pageTitle: "비밀번호 재설정"
        ) {
            VStack(alignment: .leading, spacing: 0) {
                ORITextField(
                    text: $viewModel.oldPassword,
                    placehoder: "********",
                    title: "현재 비밀번호",
                    type: .secure
                ) {
                    focusField = .newPassword
                }
                .textContentType(.password)
                .focused($focusField, equals: .oldPassword)
                
                ORITextField(
                    text: $viewModel.newPassword,
                    placehoder: "********",
                    title: "새 비밀번호",
                    type: .secure
                ) {
                    viewModel.isPresentedAlert.toggle()
                }
                .textContentType(.password)
                .focused($focusField, equals: .newPassword)
                
                Spacer()
                
                ORIButton(text: "확인", isFocused: focusField != .none) {
                    viewModel.isPresentedAlert.toggle()
                    dismiss()
                }
            }
            .onAppear {
                focusField = .oldPassword
            }
            .hideKeyboardWhenTap()
            .oriAlert(
                isPresented: $viewModel.isPresentedAlert,
                type: .renewalPassword
            ) {
                viewModel.changePasswordButtonDidTapped()
            }
        }
    }
}
