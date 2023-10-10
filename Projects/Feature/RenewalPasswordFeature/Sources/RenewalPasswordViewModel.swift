import BaseFeature
import DesignSystem
import Foundation
import Combine
import AuthDomainInterface
import UtilityModule

final class RenewalPasswordViewModel: BaseViewModel {
    @Published var oldPassword: String = ""
    @Published var oldPasswordDescription: DescriptionType?
    @Published var newPassword: String = ""
    @Published var newPasswordDescription: DescriptionType?

    @Published var isPresentedAlert = false
    @Published var isSuccessToChangePassword = false

    private let changePasswordUseCase: any ChangePasswordUseCase

    init(changePasswordUseCase: any ChangePasswordUseCase) {
        self.changePasswordUseCase = changePasswordUseCase
    }

    func changePasswordButtonDidTapped() {
        guard !oldPassword.isEmpty else {
            oldPasswordDescription = .isEmpty
            return
        }
        guard !newPassword.isEmpty else {
            newPasswordDescription = .isEmpty
            return
        }

        let passwordExpression = "^(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,20}$"

        guard newPassword ~= passwordExpression else {
            self.newPasswordDescription = .wrongPassword
            return
        }

        isPresentedAlert = true
    }

    func changePassword() {
        addCancellable(
            changePasswordUseCase.execute(
                req: .init(oldPassword: oldPassword, newPassword: newPassword)
            )
        ) { [weak self] _ in
            self?.isSuccessToChangePassword = true
        }
    }
}
