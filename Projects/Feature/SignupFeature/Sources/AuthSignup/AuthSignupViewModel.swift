import BaseFeature
import Combine
import AuthDomainInterface
import DesignSystem
import UtilityModule

final class AuthSignupViewModel: BaseViewModel {
    enum SignupStep: Int {
        case inputEmail = 0
        case inputAuthCode = 1
        case inputPassword = 2

        mutating func goToNextStep() {
            switch self {
            case .inputEmail:
                self = .inputAuthCode
            case .inputAuthCode:
                self = .inputPassword
            case .inputPassword:
                break
            }
        }
    }
    @Published var signupStep: SignupStep = .inputEmail

    @Published var email: String = ""
    @Published var emailTextFieldType: InputBoxType?
    @Published var emailDescription: DescriptionType?
    @Published var authCode: String = ""
    @Published var authCodeDescription: DescriptionType?
    @Published var password: String = ""
    @Published var passwordDescription: DescriptionType?

    @Published var isNavigatedToUserInfoSignup: Bool = false

    var signupPageText: String {
        switch signupStep {
        case .inputEmail, .inputAuthCode:
            return "이메일 입력 후 인증해주세요"

        case .inputPassword:
            return "비밀번호를 입력해주세요"
        }
    }

    var signupButtonText: String {
        switch signupStep {
        case .inputEmail:
            return "인증하기"

        case .inputAuthCode, .inputPassword:
            return "다음"
        }
    }

    private let sendAuthCodeUseCase: any SendAuthCodeUseCase
    private let verifyAuthCodeUseCase: any VerifyAuthCodeUseCase

    init(
        sendAuthCodeUseCase: any SendAuthCodeUseCase,
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase
    ) {
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase
    }

    func nextButtonDidTapped() {
        switch signupStep {
        case .inputEmail:
            guard !email.isEmpty else {
                emailDescription = .isEmpty
                return
            }
            sendAuthCode()

        case .inputAuthCode:
            guard !email.isEmpty else {
                emailDescription = .isEmpty
                return
            }
            guard !authCode.isEmpty else {
                authCodeDescription = .isEmpty
                return
            }
            verifyAuthCode()

        case .inputPassword:
            if email.isEmpty {
                emailDescription = .isEmpty
            } else if authCode.isEmpty {
                authCodeDescription = .isEmpty
            } else if password.isEmpty {
                passwordDescription = .isEmpty
            } else {
                self.navigatedToUserInfoSignup()
            }
        }
    }

    func sendAuthCode() {
        addCancellable(
            sendAuthCodeUseCase.execute(req: .init(email: email))
        ) { [weak self] _ in
            self?.emailDescription = .successToSendEmail
            self?.emailTextFieldType = .button(.sub)
            self?.signupStep.goToNextStep()
        } onReceiveError: { [weak self] _ in
            self?.emailDescription = .isNotEmail
        }
    }

    private func verifyAuthCode() {
        addCancellable(
            verifyAuthCodeUseCase.execute(req: .init(email: email, code: authCode))
        ) { [weak self] _ in
            self?.emailDescription = nil
            self?.emailTextFieldType = nil
            self?.signupStep.goToNextStep()
        } onReceiveError: { [weak self] _ in
            self?.authCodeDescription = .wrongAuthCode
        }
    }

    private func navigatedToUserInfoSignup() {
        let passwordExpression = "^(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,20}$"

        guard password ~= passwordExpression else {
            self.passwordDescription = .wrongPassword
            return
        }

        self.isNavigatedToUserInfoSignup.toggle()
    }
}
