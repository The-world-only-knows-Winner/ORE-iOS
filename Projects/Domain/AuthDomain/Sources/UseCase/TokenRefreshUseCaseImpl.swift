import AuthDomainInterface
import Combine

public struct TokenRefreshUseCaseImpl: TokenRefreshUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute() -> AnyPublisher<Void, Error> {
        authRepository.tokenRefresh()
    }
}
