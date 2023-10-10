import Combine

public protocol FetchBusStationUseCase {
    func execute(stationName: String) -> AnyPublisher<BusStationEntity, Error>
}
