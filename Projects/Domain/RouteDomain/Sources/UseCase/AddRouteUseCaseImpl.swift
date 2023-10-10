import RouteDomainInterface
import Combine

public struct AddRouteUseCaseImpl: AddRouteUseCase {
    private let routeRepository: any RouteRepository

    public init(routeRepository: any RouteRepository) {
        self.routeRepository = routeRepository
    }

    public func execute(req: AddRouteRequestDTO) -> AnyPublisher<Void, Error> {
        routeRepository.addRoute(req: req)
    }
}
