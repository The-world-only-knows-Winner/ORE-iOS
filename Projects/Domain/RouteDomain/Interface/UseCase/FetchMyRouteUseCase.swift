import Combine

public protocol FetchMyRouteListUseCase {
    func execute() -> AnyPublisher<MyRouteEntity, Error>
}
