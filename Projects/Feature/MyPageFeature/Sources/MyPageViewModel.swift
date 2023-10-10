import BaseFeature
import AuthDomainInterface
import Combine
import SwiftUI
import UserDomainInterface

final class MyPageViewModel: BaseViewModel {
    @Published var isNotificationsActive = true
    @Published var isNavigatedToChangeProfile = false
    @Published var isNavigatedToBusLog = false
    @Published var isNavigatedToRenewalPassword = false
    @Published var isShowingLogoutAlert = false
    @Published var isNavigatedToLogout = false
    @Published var myInfo: MyInfoEntity?

    private let fetchMyInfoUseCase: any FetchMyInfoUseCase
    private let logoutUseCase: any LogoutUseCase

    init(
        fetchMyInfoUseCase: any FetchMyInfoUseCase,
        logoutUseCase: any LogoutUseCase
    ) {
        self.fetchMyInfoUseCase = fetchMyInfoUseCase
        self.logoutUseCase = logoutUseCase
    }

    func fetchMyInfo() {
        addCancellable(
            fetchMyInfoUseCase.execute()
        ) { [weak self] myInfo in
            self?.myInfo = MyInfoEntity(
                name: myInfo.name,
                birthday: myInfo.birthday.replacingOccurrences(of: "-", with: ".")
            )
        }
    }

    func logout() {
        addCancellable(
            logoutUseCase.execute()
        ) { [weak self] _ in
            self?.isNavigatedToLogout = true
        }
    }
}
