import Combine
import Foundation
import CoreLocation

public protocol StationRepository {
    func fetchBusStationList(routeID: String) -> AnyPublisher<[BusStationEntity], Error>
    func fetchStationListByStationName(stationName: String) -> AnyPublisher<[StationByStationNameEntity], Error>
}
