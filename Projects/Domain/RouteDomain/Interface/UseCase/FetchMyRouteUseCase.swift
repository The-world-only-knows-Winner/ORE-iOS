import Combine

public protocol FetchMyRouteUseCase {
    func execute() -> AnyPublisher<MyRouteEntity, Error>
}
