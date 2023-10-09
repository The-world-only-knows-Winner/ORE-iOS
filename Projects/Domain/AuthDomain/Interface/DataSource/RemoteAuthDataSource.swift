import Combine
import Foundation

public protocol RemoteAuthDataSource {
    func signin(req: SigninRequestDTO) -> AnyPublisher<Void, Error>
    func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error>
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
    func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
    func logout() -> AnyPublisher<Void, Error>
    func tokenRefresh() -> AnyPublisher<Void, Error>
}
