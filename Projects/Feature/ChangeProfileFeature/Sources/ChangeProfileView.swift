import DesignSystem
import SwiftUI
import BaseFeature

struct ChangeProfileView: View {
    private enum FocusField {
        case name
        case dateBirth
    }
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: ChangeProfileViewModel

    init(
        viewModel: ChangeProfileViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ORINavigationBar(
            leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
            pageTitle: "정보수정"
        ) {
            VStack(alignment: .leading, spacing: 0) {
                ORITextField(
                    text: $viewModel.name,
                    placehoder: "홍길동",
                    title: "이름"
                ) {
                    focusField = .dateBirth
                    viewModel.nextButtonDidTapped()
                }
                .keyboardType(.namePhonePad)
                .focused($focusField, equals: .name)
                
                ORIDateField(
                    date: $viewModel.dateBirth,
                    isShowDatePicker: $viewModel.isShowDatePicker,
                    title: "생년월일"
                )
                .focused($focusField, equals: .dateBirth)
                
                Spacer()
                
                ORIButton(text: "확인", isFocused: focusField != .none) {
                    withAnimation {
                        viewModel.nextButtonDidTapped()
                    }
                }
            }
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
        }
    }
}
