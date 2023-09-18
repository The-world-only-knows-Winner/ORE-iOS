import BaseFeature
import DesignSystem
import Foundation
import Combine

final class RenewalPasswordViewModel: BaseViewModel {
    @Published var oldPassword: String = ""
//    @Published var emailTextFieldType: InputBoxType?
//    @Published var emailDescription: DescriptionType?
    @Published var newPassword: String = ""

    @Published var isPresentedAlert = false

    func changePasswordButtonDidTapped() {
        // 비밀번호 변경
    }
}
