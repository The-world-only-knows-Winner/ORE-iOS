import BaseFeature
import Foundation
import Combine

final class RenewalPasswordViewModel: BaseViewModel {
    @Published var name: String = ""
    @Published var dateBirth: Date = Calendar
        .current
        .date(from: DateComponents(year: 2000, month: 1, day: 1)) ?? .now

    @Published var isNavigatedToUserInfoSignup: Bool = false
    @Published var isSuccessSignup: Bool = false
    @Published var isShowDatePicker: Bool = false

    func nextButtonDidTapped() {
        // 대충 비빌번호 변경
    }
}
