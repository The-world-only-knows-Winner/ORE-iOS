import Combine
import Foundation

public protocol UserRepository {
    func signup(req: SignupRequestDTO) -> AnyPublisher<Void, Error>
    func fetchMyInfo() -> AnyPublisher<MyInfoEntity, Error>
    func updateMyInfo(req: UpdateMyInfoRequestDTO) -> AnyPublisher<Void, Error>
}
