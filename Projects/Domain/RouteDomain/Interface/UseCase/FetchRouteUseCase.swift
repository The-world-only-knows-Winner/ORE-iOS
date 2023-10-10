import Combine
import CoreLocation

public protocol FetchRouteUseCase {
    func execute(
        startPoint: CLLocationCoordinate2D,
        endPoint: CLLocationCoordinate2D
    ) -> AnyPublisher<RouteEntity, Error>
}
