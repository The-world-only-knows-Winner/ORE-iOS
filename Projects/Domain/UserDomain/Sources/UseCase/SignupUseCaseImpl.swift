import UserDomainInterface
import Combine

public struct SignupUseCaseImpl: SignupUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func execute(req: SignupRequestDTO) -> AnyPublisher<Void, Error> {
        userRepository.signup(req: req)
    }
}
