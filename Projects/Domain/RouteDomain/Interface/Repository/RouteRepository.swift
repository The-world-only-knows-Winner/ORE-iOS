import Combine
import Foundation
import CoreLocation

public protocol RouteRepository {
    func fetchRouteList(
        startPoint: CLLocationCoordinate2D,
        endPoint: CLLocationCoordinate2D
    ) -> AnyPublisher<RouteEntity, Error>
    func addRoute(req: AddRouteRequestDTO) -> AnyPublisher<Void, Error>
    func fetchMyRouteList() -> AnyPublisher<[MyRouteEntity], Error>
}
