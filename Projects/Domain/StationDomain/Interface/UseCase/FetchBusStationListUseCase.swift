import Combine

public protocol FetchBusStationListUseCase {
    func execute(routeID: String) -> AnyPublisher<[BusStationEntity], Error>
}
