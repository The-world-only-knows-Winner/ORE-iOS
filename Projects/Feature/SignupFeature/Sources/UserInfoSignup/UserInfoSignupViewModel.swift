import BaseFeature
import Foundation
import Combine

final class UserInfoSignupViewModel: BaseViewModel {
    enum SignupStep: Int {
        case inputName = 0
        case inputDateBirth = 1

        mutating func goToNextStep() {
            switch self {
            case .inputName:
                self = .inputDateBirth
            case .inputDateBirth:
                break
            }
        }
    }
    @Published var signupStep: SignupStep = .inputName

    @Published var name: String = ""
    @Published var dateBirth: Date = .now

    @Published var isNavigatedToUserInfoSignup: Bool = false
    @Published var isSuccessSignup: Bool = false
    @Published var isShowDatePicker: Bool = false

    var signupPageText: String {
        switch signupStep {
        case .inputName:
            return "이름을 알려주세요"

        case .inputDateBirth:
            return "생년월일을 알려주세요"
        }
    }
    var signupButtonText: String {
        switch signupStep {
        case .inputName:
            return "다음"

        case .inputDateBirth:
            return "완료"
        }
    }

    func nextButtonDidTapped() {
        switch signupStep {
        case .inputName:
            // 대충 생년월일 입력으로 감
            self.isShowDatePicker = false
            signupStep.goToNextStep()

        case .inputDateBirth:
            // 대충 회원가입 후 뷰 이동
            self.isSuccessSignup.toggle()
        }
    }
}
