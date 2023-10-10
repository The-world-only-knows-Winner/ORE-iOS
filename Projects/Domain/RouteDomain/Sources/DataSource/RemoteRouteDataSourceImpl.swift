import Combine
import BaseDomain
import RouteDomainInterface
import CoreLocation

public final class RemoteRouteDataSourceImpl: BaseRemoteDataSource<RouteAPI>, RemoteRouteDataSource {
    public func fetchRoute(
        startPoint: CLLocationCoordinate2D,
        endPoint: CLLocationCoordinate2D
    ) -> AnyPublisher<RouteEntity, Error> {
        request(.fetchRoute(startPoint: startPoint, endpoint: endPoint), dto: FetchRouteResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func addRoute(req: AddRouteRequestDTO) -> AnyPublisher<Void, Error> {
        request(.addRoute(req))
    }
}
