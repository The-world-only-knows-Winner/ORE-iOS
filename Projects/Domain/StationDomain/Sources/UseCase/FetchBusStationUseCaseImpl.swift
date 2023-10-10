import StationDomainInterface
import Combine

public struct FetchBusStationUseCaseImpl: FetchBusStationUseCase {
    private let stationRepository: any StationRepository

    public init(stationRepository: any StationRepository) {
        self.stationRepository = stationRepository
    }

    public func execute(stationName: String) -> AnyPublisher<BusStationEntity, Error> {
        stationRepository.fetchRouteStationList(stationName: stationName)
    }
}
