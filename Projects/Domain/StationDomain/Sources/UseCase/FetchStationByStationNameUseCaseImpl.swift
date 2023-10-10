import StationDomainInterface
import Combine

public struct FetchStationByStationNameUseCaseImpl: FetchStationByStationNameUseCase {
    private let stationRepository: any StationRepository

    public init(stationRepository: any StationRepository) {
        self.stationRepository = stationRepository
    }

    public func execute(routeID: String) -> AnyPublisher<StationByStationNameEntity, Error> {
        stationRepository.fetchStationByStationName(routeID: routeID)
    }
}
