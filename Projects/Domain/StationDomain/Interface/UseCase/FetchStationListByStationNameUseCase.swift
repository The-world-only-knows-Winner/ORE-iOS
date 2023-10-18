import Combine

public protocol FetchStationListByStationNameUseCase {
    func execute(stationName: String) -> AnyPublisher<[StationByStationNameEntity], Error>
}
