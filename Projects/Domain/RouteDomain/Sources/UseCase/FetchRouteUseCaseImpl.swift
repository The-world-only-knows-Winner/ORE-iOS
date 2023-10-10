import RouteDomainInterface
import Combine
import CoreLocation

public struct FetchRouteListUseCaseImpl: FetchRouteListUseCase {
    private let routeRepository: any RouteRepository

    public init(routeRepository: any RouteRepository) {
        self.routeRepository = routeRepository
    }

    public func execute(
        startPoint: CLLocationCoordinate2D,
        endPoint: CLLocationCoordinate2D
    ) -> AnyPublisher<RouteEntity, Error> {
        routeRepository.fetchRouteList(startPoint: startPoint, endPoint: endPoint)
    }
}
