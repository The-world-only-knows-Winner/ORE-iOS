import StationDomainInterface
import Combine

public struct FetchStationListByStationNameUseCaseImpl: FetchStationListByStationNameUseCase {
    private let stationRepository: any StationRepository

    public init(stationRepository: any StationRepository) {
        self.stationRepository = stationRepository
    }

    public func execute(
        stationName: String
    ) -> AnyPublisher<[StationByStationNameEntity], Error> {
        stationRepository.fetchStationListByStationName(stationName: stationName)
    }
}
