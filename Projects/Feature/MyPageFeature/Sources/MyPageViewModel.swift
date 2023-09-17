import BaseFeature
import Combine
import SwiftUI
import AuthDomainInterface

final class MyPageViewModel: BaseViewModel {
    @Published var isNotificationsActive = true
    @Published var isNavigatedToChangeProfile = false
    @Published var isNavigatedToBusLog = false
    @Published var isNavigatedToRenewalPassword = false
    @Published var isShowingLogoutAlert = false
    @Published var isNavigatedToLogout = false
}
