import StationDomainInterface
import BaseDomain
import Combine

public struct StationRepositoryImpl: StationRepository {
    private let remoteStationDataSource: any RemoteStationDataSource

    public init(remoteStationDataSource: any RemoteStationDataSource) {
        self.remoteStationDataSource = remoteStationDataSource
    }

    public func fetchRouteStationList(stationName: String) -> AnyPublisher<BusStationEntity, Error> {
        remoteStationDataSource.fetchRouteStationList(stationName: stationName)
    }

    public func fetchStationByStationName(routeID: String) -> AnyPublisher<StationByStationNameEntity, Error> {
        remoteStationDataSource.fetchStationByStationName(routeID: routeID)
    }
}
