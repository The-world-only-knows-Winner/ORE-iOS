import BaseFeature
import Combine
import AuthDomainInterface
import DesignSystem

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
    @Published var password: String = ""

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

    func nextButtonDidTapped() {
        switch signupStep {
        case .inputEmail:
            self.emailDescription = .successToSendEmail
            self.emailTextFieldType = .button(.sub)
            // 대충 이메일 보내는 함수
            signupStep.goToNextStep()

        case .inputAuthCode:
            // 대충 코드 일치하는지 판별하는 함수
            self.emailDescription = nil
            self.emailTextFieldType = nil
            signupStep.goToNextStep()

        case .inputPassword:
            // 대충 정규식 대비
            self.isNavigatedToUserInfoSignup.toggle()
        }
    }
}
