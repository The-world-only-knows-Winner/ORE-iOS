import Combine
import Foundation
import CoreLocation

public protocol StationRepository {
    func fetchRouteStationList(stationName: String) -> AnyPublisher<BusStationEntity, Error>
    func fetchStationByStationName(routeID: String) -> AnyPublisher<StationByStationNameEntity, Error>
}
