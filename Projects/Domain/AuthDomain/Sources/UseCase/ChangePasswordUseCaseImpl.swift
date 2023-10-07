import AuthDomainInterface
import Combine

public struct ChangePasswordUseCaseImpl: ChangePasswordUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error> {
        authRepository.changePassword(req: req)
    }
}
