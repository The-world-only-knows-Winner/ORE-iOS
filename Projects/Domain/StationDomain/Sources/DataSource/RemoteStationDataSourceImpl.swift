import Combine
import BaseDomain
import StationDomainInterface

public final class RemoteStationDataSourceImpl: BaseRemoteDataSource<StationAPI>, RemoteStationDataSource {
    public func fetchRouteStationList(stationName: String) -> AnyPublisher<BusStationEntity, Error> {
        request(
            .fetchRouteStationList(stationName: stationName),
            dto: FetchBusStationResponseDTO.self
        )
        .map { $0.toDomain() }
        .eraseToAnyPublisher()
    }

    public func fetchStationByStationName(routeID: String) -> AnyPublisher<StationByStationNameEntity, Error> {
        request(
            .fetchStationByStationName(routeID: routeID),
            dto: FetchStationByStationNameResponseDTO.self
        )
        .map { $0.toDomain() }
        .eraseToAnyPublisher()
    }
}
