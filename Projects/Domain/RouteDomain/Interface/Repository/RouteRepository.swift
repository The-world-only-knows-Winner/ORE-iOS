import Combine
import Foundation
import CoreLocation

public protocol RouteRepository {
    func fetchRoute(
        startPoint: CLLocationCoordinate2D,
        endPoint: CLLocationCoordinate2D
    ) -> AnyPublisher<RouteEntity, Error>
}
