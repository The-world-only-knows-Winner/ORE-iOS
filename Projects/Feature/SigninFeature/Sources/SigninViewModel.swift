import Foundation
import BaseFeature
import Combine
import DesignSystem
import AuthDomainInterface

final class SigninViewModel: BaseViewModel {
    @Published var email: String = ""
    @Published var emailDescription: DescriptionType?
    @Published var password: String = ""
    @Published var passwordDescription: DescriptionType?
    @Published var isSuccessSignin = false

    private let signinUseCase: any SigninUseCase

    init(signinUseCase: any SigninUseCase) {
        self.signinUseCase = signinUseCase
    }

    private func signin() {
        addCancellable(
            signinUseCase.execute(req: .init(email: email, password: password))
        ) { [weak self] _ in
            self?.isSuccessSignin.toggle()
        } onReceiveError: { [weak self] error in
            guard let authError = error as? AuthDomainError else { return }

            switch authError {
            case .emailNotFound:
                self?.emailDescription = .isNotAccounted

            case .passwordMisMatches:
                self?.passwordDescription = .wrongPassword

            default:
                break
            }
        }
    }

    func signinButtonDidTap() {
        if self.email.isEmpty {
            self.emailDescription = .isEmpty
        } else if self.password.isEmpty {
            self.passwordDescription = .isEmpty
        } else { signin() }
    }
}
