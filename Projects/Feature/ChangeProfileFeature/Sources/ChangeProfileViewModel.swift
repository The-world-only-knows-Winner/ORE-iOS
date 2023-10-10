import BaseFeature
import Combine
import Foundation
import UserDomainInterface
import DesignSystem

final class ChangeProfileViewModel: BaseViewModel {
    @Published var name: String = ""
    @Published var nameDescription: DescriptionType?
    @Published var dateBirth: Date = Calendar
        .current
        .date(from: DateComponents(year: 2000, month: 1, day: 1)) ?? .now

    @Published var isSuccessToUpdateMyInfo = false
    @Published var isShowDatePicker: Bool = false

    private let updateMyInfoUseCase: any UpdateMyInfoUseCase

    init(
        updateMyInfoUseCase: any UpdateMyInfoUseCase,
        name: String,
        birthday: String
    ) {
        self.updateMyInfoUseCase = updateMyInfoUseCase
        self.name = name
        self.dateBirth = birthday.toBirthdayDate()
    }

    func nextButtonDidTapped() {
        guard !name.isEmpty else {
            nameDescription = .isEmpty
            return
        }

        updateMyInfo()
    }

    private func updateMyInfo() {
        addCancellable(
            updateMyInfoUseCase.execute(
                req: .init(name: name, birthday: dateBirth.toHyphenStrng())
            )
        ) { [weak self] _ in
            self?.isSuccessToUpdateMyInfo = true
        }
    }
}
