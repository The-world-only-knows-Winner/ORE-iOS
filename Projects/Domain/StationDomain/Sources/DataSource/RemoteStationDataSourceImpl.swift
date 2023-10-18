import Combine
import BaseDomain
import StationDomainInterface

public final class RemoteStationDataSourceImpl: BaseRemoteDataSource<StationAPI>, RemoteStationDataSource {
    public func fetchBusStationList(routeID: String) -> AnyPublisher<[BusStationEntity], Error> {
        request(
            .fetchBusStationList(routeID: routeID),
            dto: FetchBusStationListResponseDTO.self
        )
        .map { $0.toDomain() }
        .eraseToAnyPublisher()
    }

    public func fetchStationListByStationName(
        stationName: String
    ) -> AnyPublisher<[StationByStationNameEntity], Error> {
        request(
            .fetchStationListByStationName(stationName: stationName),
            dto: FetchStationListByStationNameResponseDTO.self
        )
        .map { $0.toDomain() }
        .eraseToAnyPublisher()
    }
}
