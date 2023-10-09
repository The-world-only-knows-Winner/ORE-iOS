import RouteDomainInterface
import BaseDomain
import Combine
import CoreLocation

public struct RouteRepositoryImpl: RouteRepository {
    private let remoteRouteDataSource: any RemoteRouteDataSource

    public init(remoteRouteDataSource: any RemoteRouteDataSource) {
        self.remoteRouteDataSource = remoteRouteDataSource
    }

    public func fetchRoute(
        startPoint: CLLocationCoordinate2D,
        endPoint: CLLocationCoordinate2D
    ) -> AnyPublisher<RouteEntity, Error> {
        remoteRouteDataSource.fetchRoute(startPoint: startPoint, endPoint: endPoint)
    }
}
