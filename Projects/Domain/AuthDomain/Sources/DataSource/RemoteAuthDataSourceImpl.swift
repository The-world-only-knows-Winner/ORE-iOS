import AuthDomainInterface
import BaseDomain
import Combine
import JwtStoreInterface

public final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthAPI>, RemoteAuthDataSource {
    public func signin(req: SigninRequestDTO) -> AnyPublisher<Void, Error> {
        request(.signin(req))
    }

    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error> {
        request(.changePassword(req))
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        request(.sendAuthCode(req))
    }

    public func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        request(.verifyAuthCode(req))
    }

    public func logout() -> AnyPublisher<Void, Error> {
        keychain.delete(type: .accessToken)
        keychain.delete(type: .accessExpiresAt)
        keychain.delete(type: .refreshToken)
        keychain.delete(type: .refreshExpiresAt)
        return request(.logout)
    }

    public func tokenRefresh() -> AnyPublisher<Void, Error> {
        request(.tokenRefresh)
    }
}
