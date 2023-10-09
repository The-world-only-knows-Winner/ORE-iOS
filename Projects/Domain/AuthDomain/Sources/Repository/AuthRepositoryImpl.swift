import AuthDomainInterface
import Combine

public struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource

    public init(
        remoteAuthDataSource: any RemoteAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
    }

    public func signin(req: SigninRequestDTO) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.signin(req: req)
    }

    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.changePassword(req: req)
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.sendAuthCode(req: req)
    }

    public func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.verifyAuthCode(req: req)
    }

    public func logout() -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.logout()
    }

    public func tokenRefresh() -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.tokenRefresh()
    }
}
