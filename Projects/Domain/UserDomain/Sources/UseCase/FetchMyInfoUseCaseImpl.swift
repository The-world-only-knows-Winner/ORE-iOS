import UserDomainInterface
import Combine

public struct FetchMyInfoUseCaseImpl: FetchMyInfoUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func execute() -> AnyPublisher<MyInfoEntity, Error> {
        userRepository.fetchMyInfo()
    }
}
