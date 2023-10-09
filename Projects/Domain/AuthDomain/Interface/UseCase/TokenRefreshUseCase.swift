import Combine

public protocol TokenRefreshUseCase {
    func execute() -> AnyPublisher<Void, Error>
}

