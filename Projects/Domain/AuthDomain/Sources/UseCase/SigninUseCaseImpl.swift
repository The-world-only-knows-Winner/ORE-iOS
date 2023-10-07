import AuthDomainInterface
import Combine

public struct SigninUseCaseImpl: SigninUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(req: SigninRequestDTO) -> AnyPublisher<Void, Error> {
        authRepository.signin(req: req)
    }
}
