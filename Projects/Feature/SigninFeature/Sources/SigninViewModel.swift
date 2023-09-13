import Foundation
import BaseFeature
import Combine
import DesignSystem

final class SigninViewModel: BaseViewModel {
    @Published var email: String = ""
    @Published var emailDescription: DescriptionType?
    @Published var password: String = ""
    @Published var isSuccessSignin = false
}
