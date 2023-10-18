import StationDomainInterface
import Combine

public struct FetchBusStationListUseCaseImpl: FetchBusStationListUseCase {
    private let stationRepository: any StationRepository

    public init(stationRepository: any StationRepository) {
        self.stationRepository = stationRepository
    }

    public func execute(routeID: String) -> AnyPublisher<[BusStationEntity], Error> {
        stationRepository.fetchBusStationList(routeID: routeID)
    }
}
