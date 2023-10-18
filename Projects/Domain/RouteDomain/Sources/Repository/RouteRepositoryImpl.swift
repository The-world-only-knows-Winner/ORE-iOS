import RouteDomainInterface
import BaseDomain
import Combine
import CoreLocation

public struct RouteRepositoryImpl: RouteRepository {
    private let remoteRouteDataSource: any RemoteRouteDataSource

    public init(remoteRouteDataSource: any RemoteRouteDataSource) {
        self.remoteRouteDataSource = remoteRouteDataSource
    }

    public func fetchRouteList(
        startPoint: CLLocationCoordinate2D,
        endPoint: CLLocationCoordinate2D
    ) -> AnyPublisher<RouteEntity, Error> {
        remoteRouteDataSource.fetchRouteList(startPoint: startPoint, endPoint: endPoint)
    }

    public func addRoute(req: AddRouteRequestDTO) -> AnyPublisher<Void, Error> {
        remoteRouteDataSource.addRoute(req: req)
    }

    public func fetchMyRouteList() -> AnyPublisher<[MyRouteEntity], Error> {
        remoteRouteDataSource.fetchMyRouteList()
    }
}
