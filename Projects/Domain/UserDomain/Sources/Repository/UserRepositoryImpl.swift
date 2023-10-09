import UserDomainInterface
import BaseDomain
import Combine

public struct UserRepositoryImpl: UserRepository {
    private let remoteUserDataSource: any RemoteUserDataSource

    public init(
        remoteUserDataSource: any RemoteUserDataSource
    ) {
        self.remoteUserDataSource = remoteUserDataSource
    }

    public func signup(req: SignupRequestDTO) -> AnyPublisher<Void, Error> {
        remoteUserDataSource.signup(req: req)
    }

    public func fetchMyInfo() -> AnyPublisher<MyInfoEntity, Error> {
        remoteUserDataSource.fetchMyInfo()
    }

    public func updateMyInfo(req: UpdateMyInfoRequestDTO) -> AnyPublisher<Void, Error> {
        remoteUserDataSource.updateMyInfo(req: req)
    }
}
