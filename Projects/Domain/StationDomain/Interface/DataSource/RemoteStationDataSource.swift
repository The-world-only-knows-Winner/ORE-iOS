import Combine
import Foundation

public protocol RemoteStationDataSource {
    func fetchBusStationList(routeID: String) -> AnyPublisher<[BusStationEntity], Error>
    func fetchStationListByStationName(stationName: String) -> AnyPublisher<[StationByStationNameEntity], Error>
}
