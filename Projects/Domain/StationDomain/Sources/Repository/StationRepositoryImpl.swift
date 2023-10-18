import StationDomainInterface
import BaseDomain
import Combine

public struct StationRepositoryImpl: StationRepository {
    private let remoteStationDataSource: any RemoteStationDataSource

    public init(remoteStationDataSource: any RemoteStationDataSource) {
        self.remoteStationDataSource = remoteStationDataSource
    }

    public func fetchBusStationList(routeID: String) -> AnyPublisher<[BusStationEntity], Error> {
        remoteStationDataSource.fetchBusStationList(routeID: routeID)
    }

    public func fetchStationListByStationName(
        stationName: String
    ) -> AnyPublisher<[StationByStationNameEntity], Error> {
        remoteStationDataSource.fetchStationListByStationName(stationName: stationName)
    }
}
