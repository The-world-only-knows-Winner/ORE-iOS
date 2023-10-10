import Combine

public protocol AddRouteUseCase {
    func execute(req: AddRouteRequestDTO) -> AnyPublisher<Void, Error>
}
