import RouteDomainInterface
import Combine

public struct FetchMyRouteUseCaseImpl: FetchMyRouteUseCase {
    private let routeRepository: any RouteRepository

    public init(routeRepository: any RouteRepository) {
        self.routeRepository = routeRepository
    }

    public func execute() -> AnyPublisher<MyRouteEntity, Error> {
        routeRepository.fetchMyRoute()
    }
}
