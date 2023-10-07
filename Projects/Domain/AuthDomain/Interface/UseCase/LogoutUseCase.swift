import Combine

public protocol LogoutUseCase {
    func execute() -> AnyPublisher<Void, Error>
}
