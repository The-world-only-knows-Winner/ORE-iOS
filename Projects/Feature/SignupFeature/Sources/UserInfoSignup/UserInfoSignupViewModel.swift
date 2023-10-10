import BaseFeature
import DesignSystem
import Foundation
import Combine
import UserDomainInterface

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

    private let email: String
    private let password: String
    @Published var name: String = ""
    @Published var nameDescription: DescriptionType?
    @Published var dateBirth: Date = Calendar
        .current
        .date(from: DateComponents(year: 2000, month: 1, day: 1)) ?? .now

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

    private let signupUseCase: any SignupUseCase

    init(signupUseCase: any SignupUseCase, email: String, password: String) {
        self.signupUseCase = signupUseCase
        self.email = email
        self.password = password
    }

    func nextButtonDidTapped() {
        switch signupStep {
        case .inputName:
            guard !name.isEmpty else {
                nameDescription = .isEmpty
                return
            }
            self.isShowDatePicker = true
            signupStep.goToNextStep()

        case .inputDateBirth:
            self.signup(
                req: .init(
                    email: email,
                    password: password,
                    name: name,
                    birthday: dateBirth.toHyphenStrng()
                )
            )
        }
    }

    private func signup(req: SignupRequestDTO) {
        addCancellable(
            signupUseCase.execute(req: req)
        ) { [weak self] _ in
            self?.isSuccessSignup.toggle()
        }
    }
}
