import UserDomainInterface
import BaseDomain
import Combine

public final class RemoteUserDataSourceImpl: BaseRemoteDataSource<UserAPI>, RemoteUserDataSource {
    public func signup(req: SignupRequestDTO) -> AnyPublisher<Void, Error> {
        request(.signup(req))
    }

    public func fetchMyInfo() -> AnyPublisher<MyInfoEntity, Error> {
        request(.fetchMyInfo, dto: FetchMyInfoResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func updateMyInfo(req: UpdateMyInfoRequestDTO) -> AnyPublisher<Void, Error> {
        request(.updateMyInfo(req))
    }
}
