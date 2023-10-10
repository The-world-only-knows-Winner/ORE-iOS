import Combine
import Foundation

public protocol RemoteStationDataSource {
    func fetchRouteStationList(stationName: String) -> AnyPublisher<BusStationEntity, Error>
    func fetchStationByStationName(routeID: String) -> AnyPublisher<StationByStationNameEntity, Error>
}
