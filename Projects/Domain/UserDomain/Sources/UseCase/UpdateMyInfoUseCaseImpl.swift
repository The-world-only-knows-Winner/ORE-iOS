import UserDomainInterface
import Combine

public struct UpdateMyInfoUseCaseImpl: UpdateMyInfoUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func execute(req: UpdateMyInfoRequestDTO) -> AnyPublisher<Void, Error> {
        userRepository.updateMyInfo(req: req)
    }
}
